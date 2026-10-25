<script lang="ts" setup>
	import FullLayout from '@/Layouts/full/FullLayout.vue'
	import { 
		ElButton,ElTable,ElTableColumn,ElBreadcrumb,ElBreadcrumbItem,ElDrawer,ElUpload,ElIcon,ElOverlay,ElDialog,ElOverlayDialog,ElMessageBox,
		ElForm, ElFormItem,ElInput,ElSelect,ElOption,ElCheckbox
	} from 'element-plus'
	import { ref } from 'vue'
	import { ChevronRightIcon,PhotoPlusIcon } from 'vue-tabler-icons';
	import { router,Link,usePage } from '@inertiajs/vue3'
	import Pagination from '@/Shared/Pagination.vue'
	import { QuillEditor } from '@vueup/vue-quill'
	import '@vueup/vue-quill/dist/vue-quill.snow.css';

	defineProps({ 
		units:Object,
		types:Object,
		statuses:Object,
		statuscolors:Object,
		buildings:Object,
		furnishtypes:Object,
		auth: Array,
		page: Array
	});
	
	const page = usePage()
	
	const photoDrawer = ref(false);
	const handlePhotos = (index,data) => {
		photoDrawer.value = true;
		currentUnit.value = data;
	}
	const currentUnit = ref({
		name:'',
		photos:[]
	});
	const formdata = ref({
		_token: ''
	});
	const previewImage = ref({});
	const dialogVisible = ref(false);
	const handlePictureCardPreview = (uploadFile) => {
	  previewImage.value = uploadFile!
	  dialogVisible.value = true
	}
	
	const handleRemove = (uploadFile, uploadFiles) => {
	  console.log('remove this')
	  
	  let photoid = uploadFile.id;
	  
	  if(photoid == undefined){
		if(uploadFile.response != undefined && uploadFile.response.unitphoto != undefined){
			photoid = uploadFile.response.unitphoto.id;
		}
	  }
	  
	  if(photoid != undefined){
		axios.post('/admin/units/remove_photo',{id:photoid}).then(res => {
			console.log(res);
		}).catch(err => {
			console.log(err);
		})
	  }
	}
	
	const confirmDeletePhoto = () => {
		return ElMessageBox.confirm(
			'This will permanently delete the photo. Continue?',
			'Warning',
			{
			  confirmButtonText: 'OK',
			  cancelButtonText: 'Cancel',
			  type: 'warning',
			}
		)
			.then(() => {
			  return true;
			})
			.catch(() => {
			  return false;
			})
		
	}
	
	const filter = ref({});
	const unit = ref({});
	const unitFormDrawer = ref(false);
	const adFormDrawer = ref(false);

	const submitFilter = () => {
		router.get('/admin/units', filter.value, { preserveState: true });
	}
	
	const submitUnit = () => {
		axios.post('/admin/units/save', unit.value).then(res => {
			unitFormDrawer.value=false;
			resetPage();
		}).catch(err => {
			console.log(err);
		});
	}
	
	const showNewUnitDrawer = () => {
		unitFormDrawer.value=true;
		unit.value = {};
		
		
	}
	
	const resetPage = () => {
		try {
		  router.reload();
		}
		catch(err) {
		  ElMessageBox.alert('Please wait while reloading the page.', 'System Message', {
			showConfirmButton: false,
			callback: (action: Action) => {
			  ElMessage({
				type: 'info',
				message: 'Please wait while reloading the page.',
			  })
			},
		  })
		  location.reload();
		}
	}
	
	const handleEdit = (a,b) => {
	
		unitFormDrawer.value=true;
		unit.value = b;
	
	}
	
	const handleAdvertisement = (a,b) => {
	
		
		unit.value = b;
		
		if(unit.value.advertisement == undefined){
			unit.value.advertisement = {};
		}
		adFormDrawer.value=true;
	}
	const handleUploadSuccess = (a,b) => {
		currentUnit.value.photos.pop();
		a.unitphoto.url = a.unitphoto.path;
		currentUnit.value.photos.push(a.unitphoto);
		window.history.replaceState({}, document.title);
	}
	const submitAds = () => {
		unit.value.advertisement.unit_id = unit.value.id;
		axios.post('/admin/ads/save', unit.value.advertisement).then(res => {
			adFormDrawer.value=false;
			resetPage();
			
		}).catch(err => {
			console.error('Unable to save advertisement.', err);
			ElMessageBox.alert(
				err.response?.data?.message || 'Unable to save the advertisement. Please try again.',
				'Save Failed'
			);
		});
	}
	
	const setPrimaryImage = () => {
		
		axios.post('/admin/units/set_primary_image', previewImage.value).then(res => {
			ElMessageBox.alert('Success.', 'System Message', {
				showConfirmButton: true,
				callback: (action: Action) => {
				  ElMessage({
					type: 'success',
					message: 'Please wait while reloading the page.',
				  })
				},
			});
		}).catch(err => {
			console.log(err);
		});
	}
	
	const prevImage = () => {
		let index = currentUnit.value.photos.indexOf(previewImage.value);
		if(index > 0){
			index--;
			previewImage.value = currentUnit.value.photos[index];
		}
		
	}
	const nextImage = () => {
		let index = currentUnit.value.photos.indexOf(previewImage.value);
		if(index < (currentUnit.value.photos.length -1)){
			index++;
			previewImage.value = currentUnit.value.photos[index];
		}
		
	}
</script>

<template>
    <FullLayout title="Units">
        <template #header>
            <h2 class="font-semibold text-2xl text-gray-800 leading-tight">
                UNIT MANAGEMENT
			</h2>
			<el-breadcrumb :separator-icon="ChevronRightIcon">
				<el-breadcrumb-item>ADMIN</el-breadcrumb-item>
				<el-breadcrumb-item>PROPERTIES</el-breadcrumb-item>
				<el-breadcrumb-item>UNITS</el-breadcrumb-item>
			</el-breadcrumb>
        </template>
		<br />
		<el-form :inline="true" :model="filter" class="demo-form-inline1">
			<el-form-item label="Search">
				<el-input v-model="filter.name" size="small" placeholder="Search" clearable />
			</el-form-item>
			<el-form-item label="Building">
				<el-select
					v-model="filter.building_id" size="small"
					placeholder="Building"
					clearable
				  >
					<el-option v-for="(type,typeid) in buildings" :label="type" :value="typeid" />
				</el-select>
			</el-form-item>
			<el-form-item label="Type">
				<el-select
					v-model="filter.type" size="small"
					placeholder="Type"
					clearable
				  >
					<el-option v-for="(type,typeid) in types" :label="type" :value="typeid" />
				</el-select>
			</el-form-item>
			<el-form-item label="Furnished">
				<el-select
					v-model="filter.furnished" size="small"
					placeholder="Furnished"
					clearable
				  >
					<el-option v-for="(type,typeid) in furnishtypes" :label="type" :value="typeid" />
				</el-select>
			</el-form-item>
			<el-form-item>
				<el-button type="primary" class="text-white" @click="submitFilter">Search</el-button>
			</el-form-item>
			<el-form-item>
				<a class="block w-full rounded-md bg-indigo-600 px-3.5 py-2.5 text-center text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600" @click="showNewUnitDrawer">
					Add Unit
				</a>
			</el-form-item>
		</el-form>
		<br />
		<el-table :data="units.data" style="width: 100%">
			<el-table-column prop="code" label="Code" width="100"/>
			<el-table-column prop="name" label="Name" width="150" />
			<el-table-column prop="building_id" label="Building">
				<template #default="scope">
					{{ buildings[scope.row.building_id] }}
				</template>
			</el-table-column>
			<el-table-column prop="status" label="Status">
				<template #default="scope">
					
					<v-chip
					  class="ma-2"
					  :color="statuscolors[scope.row.status]"
					  text-color="white"
					>
						{{ statuses[scope.row.status] }}
					</v-chip>
				</template>
			</el-table-column>
			<el-table-column prop="type" label="Type">
				<template #default="scope">
					{{ types[scope.row.type] }}
				</template>
			</el-table-column>
			<el-table-column prop="furnished" label="Furnished">
				<template #default="scope">
					{{ furnishtypes[scope.row.furnished] }}
				</template>
			</el-table-column>
			<el-table-column label="Operations" width="350px">
			  <template #default="scope">
				<el-button size="small" @click="handlePhotos(scope.$index, scope.row)">Photos</el-button>
				<el-button size="small" @click="handleEdit(scope.$index, scope.row)">Edit</el-button>
				<el-button size="small" class="text-white" type="primary" @click="handleAdvertisement(scope.$index, scope.row)">Advertise</el-button>
				<el-button
				  size="small"
				  type="danger"
				  class="text-white"
				>
					Remove
				</el-button>
			  </template>
			</el-table-column>
		</el-table>
		<br />
		<pagination :links="units.links" :to="units.to" :total="units.total" :from="units.from" :current="units.current_page" />
		
		
		<el-dialog v-model="dialogVisible" align="center">
			<el-button @click="prevImage" > Previous </el-button>
			<el-button type="primary" @click="setPrimaryImage" class="text-white">Set as Primary</el-button>
			<el-button @click="nextImage" >Next</el-button>
			<br />
			<br />
			<img w-full :src="previewImage.url" alt="Preview Image" />
			
		</el-dialog>
		
		
		<el-drawer v-model="photoDrawer" size="50%" :title="'PHOTOS OF ' + currentUnit.name" >
			<el-upload
				v-model:file-list="currentUnit.photos"
				list-type="picture-card"
				:action="'/admin/units/add_photo/'+currentUnit.id"
				:data="formdata"
				:on-preview="handlePictureCardPreview"
				:before-remove="confirmDeletePhoto"
				:on-remove="handleRemove"
				:on-success="handleUploadSuccess"
			  >
				<el-icon><PhotoPlusIcon /></el-icon>
			</el-upload>
		</el-drawer>
		
		<el-drawer v-model="unitFormDrawer" size="50%" :title="'UNIT FORM'" >
			
			<el-form :model="unit" class="demo-form-inline2" label-width="150px" label-position="left">
				<el-form-item label="Code">
					<el-input v-model="unit.code" size="normal" placeholder="Code"  />
				</el-form-item>
				<el-form-item label="Name">
					<el-input v-model="unit.name" size="normal" placeholder="Name"  />
				</el-form-item>
				<el-form-item label="Building">
					<el-select
						v-model="unit.building_id" size="normal"
						placeholder="Building"
						style="width:100%;"
					  >
						<el-option v-for="(type,typeid) in buildings" :label="type" :value="typeid" />
					</el-select>
				</el-form-item>
				<el-form-item label="Type">
					<el-select
						v-model="unit.type" size="normal"
						placeholder="Type"
						style="width:100%;"
					  >
						<el-option v-for="(type,typeid) in types" :label="type" :value="typeid" />
					</el-select>
				</el-form-item>
				<el-form-item label="Furnished">
					<el-select
						v-model="unit.furnished" size="normal"
						placeholder="Furnished"
						style="width:100%;"
					  >
						<el-option v-for="(type,typeid) in furnishtypes" :label="type" :value="typeid" />
					</el-select>
				</el-form-item>
				
				<el-form-item label="Floor">
					<el-input v-model="unit.floor" size="normal" placeholder="Floor"  />
				</el-form-item>
				
				<el-form-item label="Max Occupants">
					<el-input v-model="unit.allowed_occupants" size="normal" placeholder="Max Occupants"  />
				</el-form-item>
				
				<el-form-item label="Pets Allowed">
					<el-checkbox v-model="unit.allow_pets" size="normal" placeholder="Pets Allowed"  />
				</el-form-item>
				
				<el-form-item label="Penthouse">
					<el-checkbox v-model="unit.is_penthouse" size="normal" placeholder="Penthouse"  />
				</el-form-item>
				
				<el-form-item label="Loft">
					<el-checkbox v-model="unit.is_loft" size="normal" placeholder="Loft"  />
				</el-form-item>
				
				<el-form-item>
					<el-button type="primary" class="text-white" @click="submitUnit">Submit</el-button>
				</el-form-item>
				
			</el-form>
		</el-drawer>
		
		<el-drawer v-model="adFormDrawer" size="50%" :title="'ADVERTISE UNIT' + unit.code" >
			<el-form :model="unit.advertisement" class="demo-form-inline3" label-width="230px" label-position="left">
				<el-form-item label="Offer Type">
					<el-select v-model="unit.advertisement.offer_type">
						<el-option label="RENT" value="1" />
						<el-option label="SALE" value="2" />
					</el-select>
				</el-form-item>
				<el-form-item label="Title">
					<el-input v-model="unit.advertisement.title" size="normal" placeholder="Title"  />
				</el-form-item>
				<el-form-item label="Featured">
					<el-checkbox v-model="unit.advertisement.is_featured" size="normal" placeholder="Featured"  />
				</el-form-item>
				<el-form-item label="Content" style="height:200px;">
					<!--<el-input v-model="unit.advertisement.ad_content" size="normal" placeholder="Content"  />-->
					<quill-editor v-model:content="unit.advertisement.ad_content" contentType="html" theme="snow"></quill-editor>
					<br />
				</el-form-item>
				
				<el-form-item label="Monthly Rate">
					<el-input v-model="unit.advertisement.monthly_rate" size="normal" placeholder="Monthly Rate"  />
				</el-form-item>
				
				<el-form-item label="Advance Payment (No of Months)">
					<el-input type="number" v-model="unit.advertisement.advance_payment" size="normal" placeholder="Advance Payment"  />
				</el-form-item>
				
				<el-form-item label="Security Deposit (No of Months)">
					<el-input type="number" v-model="unit.advertisement.deposit_security" size="normal" placeholder="Security Deposit"  />
				</el-form-item>
				
				<el-form-item label="Utility Deposit (Amount)">
					<el-input v-model="unit.advertisement.deposit_utility" size="normal" placeholder="Utility Deposit"  />
				</el-form-item>

				<el-form-item label="Minimum Stay (No of Months)">
					<el-input type="number" v-model="unit.advertisement.min_tenure" size="normal" placeholder="Minimum Stay"  />
				</el-form-item>
				
				<el-form-item>
					<el-button type="primary" class="text-white" @click="submitAds">Publish</el-button>
				</el-form-item>
				
			</el-form>
		</el-drawer>
    </FullLayout>
</template>
<style>
.ql-snow{
	width:100%;
}
</style>
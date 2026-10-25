<script setup>
	import FullLayout from '@/Layouts/full/FullLayout.vue';
	//import AppLayout from '@/Layouts/AppLayout.vue';
	

	const colors = [
	  'indigo',
	  'warning',
	  'pink darken-2',
	  'red lighten-1',
	  'deep-purple accent-4',
	];
    const slides = [
	  'First',
	  'Second',
	  'Third',
	  'Fourth',
	  'Fifth',
	];
</script>

<template>
    <FullLayout title="Dashboard">
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Dashboard
            </h2>
        </template>
		
        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">
                    
					<v-carousel
						cycle
						height="400"
						hide-delimiter-background
						show-arrows="hover"
					  >
						<v-carousel-item
						  v-for="(slide, i) in slides"
						  :key="i"
						>
						  <v-sheet
							:color="colors[i]"
							height="100%"
						  >
							<div class="d-flex fill-height justify-center align-center">
							  <div class="text-h2">
								{{ slide }} Slide
							  </div>
							</div>
						  </v-sheet>
						</v-carousel-item>
					  </v-carousel>
					
                </div>
            </div>
        </div>
    </FullLayout>
</template>

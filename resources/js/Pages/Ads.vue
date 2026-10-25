
<template>
  <div class="bg-white">
    <AppLayout>
      <TransitionRoot as="template" :show="mobileFiltersOpen">
        <Dialog as="div" class="relative z-40 lg:hidden" @close="mobileFiltersOpen = false">
          <TransitionChild as="template" enter="transition-opacity ease-linear duration-300" enter-from="opacity-0" enter-to="opacity-100" leave="transition-opacity ease-linear duration-300" leave-from="opacity-100" leave-to="opacity-0">
            <div class="fixed inset-0 bg-black bg-opacity-25" />
          </TransitionChild>

          <div class="fixed inset-0 z-40 flex">
            <TransitionChild as="template" enter="transition ease-in-out duration-300 transform" enter-from="translate-x-full" enter-to="translate-x-0" leave="transition ease-in-out duration-300 transform" leave-from="translate-x-0" leave-to="translate-x-full">
              <DialogPanel class="relative ml-auto flex h-full w-full max-w-xs flex-col overflow-y-auto bg-white py-4 pb-12 shadow-xl">
                <div class="flex items-center justify-between px-4">
                  <h2 class="text-lg font-medium text-gray-900">Filters</h2>
                  <button type="button" class="-mr-2 flex h-10 w-10 items-center justify-center rounded-md bg-white p-2 text-gray-400" @click="mobileFiltersOpen = false">
                    <span class="sr-only">Close menu</span>
                    <XMarkIcon class="h-6 w-6" aria-hidden="true" />
                  </button>
                </div>

                <!-- Filters -->
                <form class="mt-4 border-t border-gray-200">
                  <Disclosure as="div" v-for="section in filters" :key="section.id" class="border-t border-gray-200 px-4 py-6" v-slot="{ open }">
                    <h3 class="-mx-2 -my-3 flow-root">
                      <DisclosureButton class="flex w-full items-center justify-between bg-white px-2 py-3 text-gray-400 hover:text-gray-500">
                        <span class="font-medium text-gray-900">{{ section.name }}</span>
                        <span class="ml-6 flex items-center">
                          <PlusIcon v-if="!open" class="h-5 w-5" aria-hidden="true" />
                          <MinusIcon v-else class="h-5 w-5" aria-hidden="true" />
                        </span>
                      </DisclosureButton>
                    </h3>
                    <DisclosurePanel class="pt-6">
                      <div class="space-y-6">
                        <div v-for="(option, optionIdx) in section.options" :key="option.value" class="flex items-center">
                          <input :id="`filter-mobile-${section.id}-${optionIdx}`" v-model="selectedFilters[section.id]" :name="`${section.id}[]`" :value="option.value" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500" />
                          <label :for="`filter-mobile-${section.id}-${optionIdx}`" class="ml-3 min-w-0 flex-1 text-gray-500">{{ option.label }}</label>
                        </div>
                      </div>
                    </DisclosurePanel>
                  </Disclosure>
                </form>
              </DialogPanel>
            </TransitionChild>
          </div>
        </Dialog>
      </TransitionRoot>

      <main class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div class="flex items-baseline justify-between border-b border-gray-200 pb-6 pt-8">
          <h1 class="text-xl font-bold tracking-tight text-gray-900">Available Units</h1>

          <div class="flex items-center">
            <Menu as="div" class="relative inline-block text-left">
              <div>
                <MenuButton class="group inline-flex justify-center text-sm font-medium text-gray-700 hover:text-gray-900">
                  {{ selectedSortLabel }}
                  <ChevronDownIcon class="-mr-1 ml-1 h-5 w-5 flex-shrink-0 text-gray-400 group-hover:text-gray-500" aria-hidden="true" />
                </MenuButton>
              </div>

              <transition enter-active-class="transition ease-out duration-100" enter-from-class="transform opacity-0 scale-95" enter-to-class="transform opacity-100 scale-100" leave-active-class="transition ease-in duration-75" leave-from-class="transform opacity-100 scale-100" leave-to-class="transform opacity-0 scale-95">
                <MenuItems class="absolute right-0 z-10 mt-2 w-40 origin-top-right rounded-md bg-white shadow-2xl ring-1 ring-black ring-opacity-5 focus:outline-none">
                  <div class="py-1">
                    <MenuItem v-for="option in sortOptions" :key="option.value" v-slot="{ active }">
                      <button type="button" @click="selectedSort = option.value" :class="[selectedSort === option.value ? 'font-medium text-gray-900' : 'text-gray-500', active ? 'bg-gray-100' : '', 'block w-full px-4 py-2 text-left text-sm']">{{ option.name }}</button>
                    </MenuItem>
                  </div>
                </MenuItems>
              </transition>
            </Menu>

            <button type="button" class="-m-2 ml-5 p-2 text-gray-400 hover:text-gray-500 sm:ml-7">
              <span class="sr-only">View grid</span>
              <Squares2X2Icon class="h-5 w-5" aria-hidden="true" />
            </button>
            <button type="button" class="-m-2 ml-4 p-2 text-gray-400 hover:text-gray-500 sm:ml-6 lg:hidden" @click="mobileFiltersOpen = true">
              <span class="sr-only">Filters</span>
              <FunnelIcon class="h-5 w-5" aria-hidden="true" />
            </button>
          </div>
        </div>

        <section aria-labelledby="products-heading" class="pb-24 pt-6">
          <h2 id="products-heading" class="sr-only">Products</h2>

          <div class="grid grid-cols-1 gap-x-8 gap-y-10 lg:grid-cols-4">
            <!-- Filters -->
            <form class="hidden lg:block">
              <Disclosure as="div" v-for="section in filters" :key="section.id" class="border-b border-gray-200 py-6" v-slot="{ open }">
                <h3 class="-my-3 flow-root">
                  <DisclosureButton class="flex w-full items-center justify-between bg-white py-3 text-sm text-gray-400 hover:text-gray-500">
                    <span class="font-medium text-gray-900">{{ section.name }}</span>
                    <span class="ml-6 flex items-center">
                      <PlusIcon v-if="!open" class="h-5 w-5" aria-hidden="true" />
                      <MinusIcon v-else class="h-5 w-5" aria-hidden="true" />
                    </span>
                  </DisclosureButton>
                </h3>
                <DisclosurePanel class="pt-6">
                  <div class="space-y-4">
                    <div v-for="(option, optionIdx) in section.options" :key="option.value" class="flex items-center">
                      <input :id="`filter-${section.id}-${optionIdx}`" v-model="selectedFilters[section.id]" :name="`${section.id}[]`" :value="option.value" type="checkbox" class="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500" />
                      <label :for="`filter-${section.id}-${optionIdx}`" class="ml-3 text-sm text-gray-600">{{ option.label }}</label>
                    </div>
                  </div>
                </DisclosurePanel>
              </Disclosure>
            </form>
			
            <!-- Product grid -->
            <div class="lg:col-span-3">
			
			<div class="mt-6 grid grid-cols-1 gap-x-6 gap-y-10 sm:grid-cols-2 lg:grid-cols-4 xl:gap-x-8">
				<p class="col-span-full text-sm text-gray-500">
				  Showing {{ filteredAdvertisements.length }} of {{ allAdvertisements.length }} units
				</p>
				<p v-if="filteredAdvertisements.length === 0" class="col-span-full rounded-md border border-dashed border-gray-300 p-8 text-center text-sm text-gray-500">
				  No units match the selected filters.
				</p>
				<button
				  v-for="ad in filteredAdvertisements"
				  :key="ad.id"
				  type="button"
				  class="group relative w-full text-left"
				  @click="selectedAdvertisement = ad"
				>
				  <div class="aspect-h-1 aspect-w-1 w-full overflow-hidden rounded-md bg-gray-200 lg:aspect-none group-hover:opacity-75 lg:h-80">
					<img :src="ad.unit?.main_photo?.path || '/assets/img/cover.jpg'" :alt="ad.title" class="h-full w-full object-cover object-center lg:h-full lg:w-full" />
				  </div>
				  <div class="mt-4 flex justify-between">
					<div>
					  <h3 class="text-sm text-gray-700">
						<b>{{ ad.title }}</b>
					  </h3>
					  <p class="mt-1 text-sm text-gray-500">{{ ad.unit?.summary ? ad.unit.summary.join(' * ') : '' }}</p>
					</div>
					<p class="text-sm font-medium text-gray-900">{{ ad.monthly_rate }}</p>
				  </div>
				</button>
			  </div>
            </div>
          </div>
        </section>
      </main>
	  <AdvertisementGalleryModal
		:open="Boolean(selectedAdvertisement)"
		:advertisement="selectedAdvertisement"
		@close="selectedAdvertisement = null"
	  />
    </AppLayout>
  </div>
</template>

<script setup>
import { computed, ref } from 'vue'
import {
  Dialog,
  DialogPanel,
  Disclosure,
  DisclosureButton,
  DisclosurePanel,
  Menu,
  MenuButton,
  MenuItem,
  MenuItems,
  TransitionChild,
  TransitionRoot,
} from '@headlessui/vue'
import AppLayout from '@/Layouts/AppLayout.vue'
import AdvertisementGalleryModal from '@/Components/AdvertisementGalleryModal.vue'
import { XMarkIcon } from '@heroicons/vue/24/outline'
import { ChevronDownIcon, FunnelIcon, MinusIcon, PlusIcon, Squares2X2Icon } from '@heroicons/vue/20/solid'

const props = defineProps({
	advertisements: Object,
	furnishtypes: Object,
	types: Object,
});

const selectedAdvertisement = ref(null)

const allAdvertisements = computed(() => Array.isArray(props.advertisements) ? props.advertisements : [])
const selectedSort = ref('newest')
const selectedFilters = ref({
	unitType: [],
	furnishing: [],
	offerType: [],
})
const sortOptions = [
  { name: 'Newest', value: 'newest' },
  { name: 'Featured first', value: 'featured' },
  { name: 'Price / rate: Low to High', value: 'rate-ascending' },
  { name: 'Price / rate: High to Low', value: 'rate-descending' },
]
const selectedSortLabel = computed(() =>
	sortOptions.find(option => option.value === selectedSort.value)?.name || 'Sort'
)

const filters = computed(() => [
  {
    id: 'unitType',
    name: 'Unit Type',
    options: Object.entries(props.types || {}).map(([value, label]) => ({ value: String(value), label })),
  },
  {
    id: 'furnishing',
    name: 'Furnishing Type',
    options: Object.entries(props.furnishtypes || {}).map(([value, label]) => ({ value: String(value), label })),
  },
  {
    id: 'offerType',
    name: 'Offer Type',
    options: [
      { value: '1', label: 'Rent' },
      { value: '2', label: 'Sale' },
    ],
  },
])

const filteredAdvertisements = computed(() => {
	const filtered = allAdvertisements.value.filter(ad => {
		const selectedUnitTypes = selectedFilters.value.unitType
		const selectedFurnishing = selectedFilters.value.furnishing
		const selectedOfferTypes = selectedFilters.value.offerType

		return (
			(selectedUnitTypes.length === 0 || selectedUnitTypes.includes(String(ad.unit?.type))) &&
			(selectedFurnishing.length === 0 || selectedFurnishing.includes(String(ad.unit?.furnished))) &&
			(selectedOfferTypes.length === 0 || selectedOfferTypes.includes(String(ad.offer_type)))
		)
	})

	return filtered.sort((a, b) => {
		if (selectedSort.value === 'featured') {
			return Number(b.is_featured || 0) - Number(a.is_featured || 0)
		}

		if (selectedSort.value === 'rate-ascending' || selectedSort.value === 'rate-descending') {
			const getPrice = advertisement => {
				const amount = advertisement.monthly_rate ?? advertisement.price
				return amount === null || amount === '' || !Number.isFinite(Number(amount))
					? null
					: Number(amount)
			}
			const aPrice = getPrice(a)
			const bPrice = getPrice(b)
			if (aPrice === null || bPrice === null) {
				if (aPrice === bPrice) return 0
				return aPrice === null ? 1 : -1
			}

			const direction = selectedSort.value === 'rate-ascending' ? 1 : -1
			return (aPrice - bPrice) * direction
		}

		return new Date(b.created_at || 0).getTime() - new Date(a.created_at || 0).getTime()
	})
})

const mobileFiltersOpen = ref(false)
</script>
<script setup>
import { computed, ref, watch } from 'vue'
import { Dialog, DialogPanel, TransitionChild, TransitionRoot } from '@headlessui/vue'
import { XMarkIcon } from '@heroicons/vue/24/outline'
import { ChevronLeftIcon, ChevronRightIcon } from '@heroicons/vue/20/solid'
import { getAdvertisementDescription } from '@/Helpers/advertisementDescription'

const props = defineProps({
	open: Boolean,
	advertisement: Object,
})

const emit = defineEmits(['close'])
const activePhotoIndex = ref(0)

const photos = computed(() => {
	const unitPhotos = props.advertisement?.unit?.photos || []
	if (unitPhotos.length) return unitPhotos

	const mainPhoto = props.advertisement?.unit?.main_photo
	return mainPhoto?.path ? [mainPhoto] : []
})

const activePhoto = computed(() => photos.value[activePhotoIndex.value])
const description = computed(() => getAdvertisementDescription(props.advertisement))

watch(() => props.open, (isOpen) => {
	if (isOpen) activePhotoIndex.value = 0
})

const close = () => emit('close')

const showPreviousPhoto = () => {
	if (photos.value.length > 1) {
		activePhotoIndex.value = (activePhotoIndex.value - 1 + photos.value.length) % photos.value.length
	}
}

const showNextPhoto = () => {
	if (photos.value.length > 1) {
		activePhotoIndex.value = (activePhotoIndex.value + 1) % photos.value.length
	}
}
</script>

<template>
	<TransitionRoot as="template" :show="open">
		<Dialog as="div" class="relative z-[100]" @close="close">
			<TransitionChild
				as="template"
				enter="ease-out duration-300"
				enter-from="opacity-0"
				enter-to="opacity-100"
				leave="ease-in duration-200"
				leave-from="opacity-100"
				leave-to="opacity-0"
			>
				<div class="fixed inset-0 bg-black/80" />
			</TransitionChild>

			<div class="fixed inset-0 z-10 overflow-y-auto">
				<div class="flex min-h-full items-center justify-center p-0 sm:p-4">
					<TransitionChild
						as="template"
						enter="ease-out duration-300"
						enter-from="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
						enter-to="opacity-100 translate-y-0 sm:scale-100"
						leave="ease-in duration-200"
						leave-from="opacity-100 translate-y-0 sm:scale-100"
						leave-to="opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"
					>
						<DialogPanel class="flex h-[100dvh] w-full max-w-7xl flex-col overflow-hidden bg-white shadow-2xl sm:h-[88vh] sm:rounded-xl lg:flex-row">
							<section class="relative flex min-h-[40vh] flex-1 items-center justify-center bg-slate-950 lg:min-h-0">
								<img
									v-if="activePhoto"
									:src="activePhoto.path"
									:alt="advertisement?.title || 'Unit photo'"
									class="h-full w-full object-contain"
								/>
								<div v-else class="px-6 text-center text-slate-300">
									No photos available for this unit.
								</div>

								<button
									v-if="photos.length > 1"
									type="button"
									class="absolute left-4 top-1/2 flex h-11 w-11 -translate-y-1/2 items-center justify-center rounded-full bg-black/60 text-white hover:bg-black/80 focus:outline-none focus:ring-2 focus:ring-white"
									aria-label="Previous photo"
									@click="showPreviousPhoto"
								>
									<ChevronLeftIcon class="h-6 w-6" aria-hidden="true" />
								</button>
								<button
									v-if="photos.length > 1"
									type="button"
									class="absolute right-4 top-1/2 flex h-11 w-11 -translate-y-1/2 items-center justify-center rounded-full bg-black/60 text-white hover:bg-black/80 focus:outline-none focus:ring-2 focus:ring-white"
									aria-label="Next photo"
									@click="showNextPhoto"
								>
									<ChevronRightIcon class="h-6 w-6" aria-hidden="true" />
								</button>
								<div
									v-if="photos.length > 1"
									class="absolute bottom-4 left-1/2 -translate-x-1/2 rounded-full bg-black/65 px-3 py-1 text-sm text-white"
									aria-live="polite"
								>
									{{ activePhotoIndex + 1 }} / {{ photos.length }}
								</div>
							</section>

							<aside class="flex min-h-0 w-full flex-1 flex-col lg:w-[38%] lg:flex-none">
								<header class="flex shrink-0 items-start justify-between gap-4 border-b border-slate-200 px-5 py-4 sm:px-7">
									<div class="min-w-0">
										<h2 class="text-xl font-semibold text-slate-900">{{ advertisement?.title }}</h2>
										<p v-if="advertisement?.monthly_rate" class="mt-1 text-sm font-medium text-sky-700">
											{{ advertisement.monthly_rate }}
										</p>
										<p v-if="advertisement?.unit?.summary?.length" class="mt-1 text-sm text-slate-500">
											{{ advertisement.unit.summary.join(' · ') }}
										</p>
									</div>
									<button
										type="button"
										class="flex h-9 w-9 shrink-0 items-center justify-center rounded-full text-slate-500 hover:bg-slate-100 hover:text-slate-900 focus:outline-none focus:ring-2 focus:ring-sky-600"
										aria-label="Close gallery"
										@click="close"
									>
										<XMarkIcon class="h-6 w-6" aria-hidden="true" />
									</button>
								</header>
								<div class="min-h-0 flex-1 overflow-y-auto px-5 py-5 sm:px-7">
									<div
										v-if="description"
										class="advertisement-description"
										v-html="description"
									/>
									<p v-else class="text-sm text-slate-500">No additional description available.</p>
								</div>
							</aside>
						</DialogPanel>
					</TransitionChild>
				</div>
			</div>
		</Dialog>
	</TransitionRoot>
</template>

<style>
.advertisement-description {
	color: #334155;
	font-size: 0.95rem;
	line-height: 1.7;
	overflow-wrap: anywhere;
}

.advertisement-description p {
	margin: 0 0 0.9rem;
}

.advertisement-description ul,
.advertisement-description ol {
	margin: 0 0 0.9rem;
	padding-left: 1.5rem;
}

.advertisement-description ul {
	list-style: disc;
}

.advertisement-description ol {
	list-style: decimal;
}

.advertisement-description a {
	color: #0369a1;
	text-decoration: underline;
}
</style>

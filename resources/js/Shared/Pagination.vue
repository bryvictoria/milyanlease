<template>
	<div v-if="links.length > 3 " class="hidden sm:flex sm:flex-1 sm:items-center sm:justify-between">
		<div>
		  <p class="text-sm text-gray-700">
			Showing
			<span class="font-medium"> {{ from }}</span>
			to
			<span class="font-medium"> {{ to }} </span>
			of
			<span class="font-medium"> {{ total }}</span>
			results
		  </p>
		</div>
		<div>
		  <nav class="isolate inline-flex -space-x-px rounded-md shadow-sm" aria-label="Pagination">
			
			
			<Link preserve-state :href="links[0].url" class="relative inline-flex items-center rounded-l-md px-2 py-2 text-gray-400 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0">
			  <span class="sr-only">Previous</span>
			  <svg class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
				<path fill-rule="evenodd" d="M12.79 5.23a.75.75 0 01-.02 1.06L8.832 10l3.938 3.71a.75.75 0 11-1.04 1.08l-4.5-4.25a.75.75 0 010-1.08l4.5-4.25a.75.75 0 011.06.02z" clip-rule="evenodd" />
			  </svg>
			</Link>
			
			<template v-for="(link,index) in links" >
				<template v-if="index > 0 && index < (links.length - 1)">
					<Link preserve-state v-if="(index) == current" aria-current="page" class="relative z-10 inline-flex items-center bg-indigo-600 px-4 py-2 text-sm font-semibold text-white focus:z-20 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600" :href="link.url" v-html="link.label"></Link>
					<Link preserve-state v-else class="relative inline-flex items-center px-4 py-2 text-sm font-semibold text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0" :href="link.url" v-html="link.label"></Link>
				</template>
			</template>
			<Link preserve-state :href="links[links.length-1].url" class="relative inline-flex items-center rounded-r-md px-2 py-2 text-gray-400 ring-1 ring-inset ring-gray-300 hover:bg-gray-50 focus:z-20 focus:outline-offset-0">
			  <span class="sr-only">Next</span>
			  <svg class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
				<path fill-rule="evenodd" d="M7.21 14.77a.75.75 0 01.02-1.06L11.168 10 7.23 6.29a.75.75 0 111.04-1.08l4.5 4.25a.75.75 0 010 1.08l-4.5 4.25a.75.75 0 01-1.06-.02z" clip-rule="evenodd" />
			  </svg>
			</Link>
			
		  </nav>
		</div>
	</div>
</template>

<script lang="ts">
import { Link } from '@inertiajs/vue3'

export default {
  components: {
    Link,
  },
  props: {
    links: Array,
	from: Number,
	to: Number,
	current: Number,
	total: Number,
	
  },
}
</script>

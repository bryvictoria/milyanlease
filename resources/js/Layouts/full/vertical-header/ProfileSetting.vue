<script setup lang="ts">
	import { computed } from 'vue'
	import { usePage,Link } from '@inertiajs/vue3'

	const page = usePage()

	const user = computed(() => page.props.auth.user)
</script>

<template>
    <v-menu :close-on-content-click="false">
        <template v-slot:activator="{ props }">
            <v-btn class="profileBtn custom-hover-primary" variant="text" v-bind="props" icon>
                <v-avatar size="35">
                    <img :src="user.profile_photo_url" height="35" alt="user" />
                </v-avatar>
            </v-btn>
        </template>
        <v-sheet rounded="md" width="200" elevation="10" class="mt-2">
            <v-list class="py-0" lines="one" density="compact">
                <v-list-item value="item1" active-color="primary" class="mt-3">
                  <div class="d-flex">
                    <div class="flex-shrink-0 mt-2 me-3">
                      <div class="avatar avatar-online">
                        <img :src="user.profile_photo_url" alt=""  width="35" class="w-px-40 h-auto rounded-circle">
                      </div>
                    </div>
                    <div class="flex-grow-1">
                      <span class="fw-semibold d-block"><b>{{ user.name}}</b></span>
                      <small class="text-muted">{{ user.current_team.name}}</small>
                    </div>
                  </div>
                </v-list-item>
				<v-list-item value="item1" active-color="primary" >
                    <template v-slot:prepend>
                        <Link stroke-width="1.5" size="20"/>
                    </template>
                    <v-list-item-title class="pl-4 text-body-1" > <Link :href="route('profile.show')">Profile</Link></v-list-item-title>
                </v-list-item>
                
            </v-list>
            <div class="pt-4 pb-4 px-5 text-center">
                <v-btn to="/auth/login" color="primary" variant="outlined" block>Logout</v-btn>
            </div>
        </v-sheet>
    </v-menu>
</template>

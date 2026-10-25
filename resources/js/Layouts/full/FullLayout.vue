<script setup lang="ts">
import MainView from './Main.vue';
</script>

<template>
    <v-locale-provider >
        <v-app>
            <MainView>
				<template #header>
					<slot name="header" />
				</template>
			</MainView>
			
            <v-main>
                <v-container fluid class="page-wrapper">
                    <div class="maxWidth">
                        <slot />
                    </div>
                </v-container>
            </v-main>
        </v-app>
    </v-locale-provider>
</template>

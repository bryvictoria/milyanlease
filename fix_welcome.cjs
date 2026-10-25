const fs = require('fs');
const path = 'resources/js/Pages/Welcome.vue';
let c = fs.readFileSync(path, 'utf8');

// Replace the old featured units block with the new clickable gallery version
const oldBlock = `\t\t  <div  v-for="(featured,index) in featuredUnits" class="col-lg-3 col-sm-6 col-xs-12">\n\t\t\t<div  class="card card-block" style="height: 300px; position: relative;">\n\t\t\t  <span v-if="featured.unit?.photos?.length > 1" style="position: absolute; top: 12px; right: 12px; background: rgba(0,0,0,0.65); color: #fff; border-radius: 4px; padding: 3px 8px; font-size: 12px; z-index: 10; pointer-events: none;">\n\t\t\t\t<i class="bi bi-images"></i> {{ featured.unit.photos.length }} Photos\n\t\t\t  </span>\n\t\t\t  <a :href="featured.unit?.main_photo?.path || '/assets/img/cover.jpg'" class="portfolio-lightbox" :data-gallery="'gallery-' + featured.id" :data-glightbox="'title:' + (featured.title || '') + '; description: ' + (featured.unit?.summary ? featured.unit.summary.join(', ') : '') + '<a>Model Details</a>'">\n\t\t\t\t<img alt="" :src="featured.unit?.main_photo?.path || '/assets/img/cover.jpg'" style="height: 300px;">\n\t\t\t\t<div class="portfolio-over">\n\t\t\t\t  <div>\n\t\t\t\t\t<h3 class="card-title">\n\t\t\t\t\t  {{ featured.title }}\n\t\t\t\t\t</h3>\n\n\t\t\t\t\t<p class="card-text">\n\t\t\t\t\t  {{ featured.unit?.summary ? featured.unit.summary.join(', ') : '' }}\n\t\t\t\t\t</p>\n\t\t\t\t  </div>\n\t\t\t\t</div>\n\t\t\t  </a>\n\t\t\t  <template v-if="featured.unit?.photos && featured.unit.photos.length > 1">\n\t\t\t\t<a v-for="photo in featured.unit.photos.filter(p => p.path !== (featured.unit?.main_photo?.path || ''))"\n\t\t\t\t   :key="photo.id"\n\t\t\t\t   :href="photo.path"\n\t\t\t\t   class="portfolio-lightbox"\n\t\t\t\t   style="display: none;"\n\t\t\t\t   :data-gallery="'gallery-' + featured.id"\n\t\t\t\t   :data-glightbox="'title:' + (featured.title || '') + '; description: ' + (featured.unit?.summary ? featured.unit.summary.join(', ') : '')">\n\t\t\t\t</a>\n\t\t\t  </template>\n\t\t\t</div>\n\t\t  </div>`;

const newBlock = `\t\t  <div v-for="(featured,index) in featuredUnits" class="col-lg-3 col-sm-6 col-xs-12">\n\t\t\t<div class="card card-block" style="height: 300px; position: relative; cursor: pointer;" @click.prevent="openGallery(featured, 0)">\n\t\t\t  <span v-if="featured.unit?.photos?.length > 1" style="position: absolute; top: 12px; right: 12px; background: rgba(0,0,0,0.65); color: #fff; border-radius: 4px; padding: 3px 8px; font-size: 12px; z-index: 10; pointer-events: none;">\n\t\t\t\t\xf0\x9f\x93\xb7 {{ featured.unit.photos.length }} Photos\n\t\t\t  </span>\n\t\t\t  <img alt="" :src="featured.unit?.main_photo?.path || '/assets/img/cover.jpg'" style="height: 300px; width: 100%; object-fit: cover;">\n\t\t\t  <div class="portfolio-over">\n\t\t\t\t<div>\n\t\t\t\t  <h3 class="card-title">{{ featured.title }}</h3>\n\t\t\t\t  <p class="card-text">{{ featured.unit?.summary ? featured.unit.summary.join(', ') : '' }}</p>\n\t\t\t\t</div>\n\t\t\t  </div>\n\t\t\t</div>\n\t\t  </div>`;

if (c.includes(oldBlock)) {
    c = c.replace(oldBlock, newBlock);
    fs.writeFileSync(path, c, 'utf8');
    console.log('REPLACED OK');
} else {
    console.log('NOT FOUND - dumping area:');
    const idx = c.indexOf('col-lg-3 col-sm-6');
    console.log(JSON.stringify(c.slice(idx, idx + 500)));
}

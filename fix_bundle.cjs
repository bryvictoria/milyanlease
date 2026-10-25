const fs = require('fs');
const path = 'public/build/assets/Welcome-60070ccf.js';
let c = fs.readFileSync(path, 'utf8');

// Find the setup function and inject openGallery before return
const setupTarget = `b=()=>{e.post("/message/save",{preserveScroll:!0,onSuccess:()=>{e.reset(),u.value=""},onError:c=>{let a=[];for(let i in c)a.push(c[i]);u.value=a.join(", ")}})};return`;
const setupReplacement = `b=()=>{e.post("/message/save",{preserveScroll:!0,onSuccess:()=>{e.reset(),u.value=""},onError:c=>{let a=[];for(let i in c)a.push(c[i]);u.value=a.join(", ")}})};const openGallery=(feat,startIdx)=>{const photos=feat&&feat.unit&&feat.unit.photos;if(!photos||photos.length===0){const fb=feat&&feat.unit&&feat.unit.main_photo&&feat.unit.main_photo.path;if(fb)GLightbox({elements:[{href:fb,type:"image",title:feat.title||""}]}).open();return;}const elements=photos.map(p=>({href:p.path,type:"image",title:feat.title||"",description:feat.unit&&feat.unit.summary?feat.unit.summary.join(", "):""}));GLightbox({elements,startAt:startIdx||0}).open();};return`;

// Replace the featured units render block: swap static <a> with clickable div
const renderOld = `ye(s.featuredUnits,(i,h)=>(F(),U("div",$e,[t("div",Ge,[t("a",{href:i.unit?.main_photo?.path||"/assets/img/cover.jpg",class:"portfolio-lightbox","data-gallery":"portfolioGallery","data-glightbox":"title:"+i.title+"; description: "+(i.unit?.summary?i.unit.summary.join(", "):"")+"\u003ca\u003eModel Details\u003c/a\u003e"},[t("img",{alt:"",src:i.unit?.main_photo?.path||"/assets/img/cover.jpg",style:{height:"300px"}},null,8,Ke),t("div",Qe,[t("div",null,[t("h3",Ze,I(i.title),1),t("p",Xe,I(i.unit.summary.join(", ")),1)])])],8,Je)])]))),256)`;

const renderNew = `ye(s.featuredUnits,(i,h)=>(F(),U("div",$e,[t("div",{style:{height:"300px",position:"relative",cursor:"pointer"},onClick:()=>openGallery(i,0)},[i.unit&&i.unit.photos&&i.unit.photos.length>1?t("span",{style:{position:"absolute",top:"12px",right:"12px",background:"rgba(0,0,0,0.65)",color:"#fff","border-radius":"4px",padding:"3px 8px","font-size":"12px","z-index":10,"pointer-events":"none"}},"📷 "+(i.unit.photos.length)+" Photos"):Q("",!0),t("img",{alt:"",src:i.unit&&i.unit.main_photo&&i.unit.main_photo.path?i.unit.main_photo.path:"/assets/img/cover.jpg",style:{height:"300px",width:"100%","object-fit":"cover"}},null,8,["src"]),t("div",Qe,[t("div",null,[t("h3",Ze,I(i.title),1),t("p",Xe,I(i.unit&&i.unit.summary?i.unit.summary.join(", "):""),1)])])])]))),256)`;

let changed = false;

if (c.includes(setupTarget)) {
    c = c.replace(setupTarget, setupReplacement);
    console.log('Setup injection: OK');
    changed = true;
} else {
    console.log('Setup injection: NOT FOUND');
}

if (c.includes(renderOld)) {
    c = c.replace(renderOld, renderNew);
    console.log('Render block: OK');
    changed = true;
} else {
    console.log('Render block: NOT FOUND');
    // Try to find and show context
    const idx = c.indexOf('featuredUnits');
    if (idx !== -1) {
        console.log('featuredUnits context:', JSON.stringify(c.slice(idx, idx+300)));
    }
}

if (changed) {
    fs.writeFileSync(path, c, 'utf8');
    console.log('File saved.');
}


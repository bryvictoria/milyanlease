const allowedTags = new Set([
	'A',
	'B',
	'BLOCKQUOTE',
	'BR',
	'EM',
	'H1',
	'H2',
	'H3',
	'H4',
	'H5',
	'H6',
	'I',
	'LI',
	'OL',
	'P',
	'S',
	'STRONG',
	'U',
	'UL',
]);

const safeHref = (href) => {
	try {
		const url = new URL(href, window.location.origin);
		return ['http:', 'https:', 'mailto:', 'tel:'].includes(url.protocol) ? href : null;
	} catch {
		return null;
	}
};

const appendSafeNode = (source, target) => {
	if (source.nodeType === Node.TEXT_NODE) {
		target.appendChild(document.createTextNode(source.textContent || ''));
		return;
	}

	if (source.nodeType !== Node.ELEMENT_NODE) return;

	const tagName = source.tagName.toUpperCase();
	if (['SCRIPT', 'STYLE', 'IFRAME', 'OBJECT', 'SVG', 'MATH', 'TEMPLATE'].includes(tagName)) return;

	if (!allowedTags.has(tagName)) {
		for (const child of source.childNodes) appendSafeNode(child, target);
		return;
	}

	const element = document.createElement(tagName.toLowerCase());
	if (tagName === 'A') {
		const href = safeHref(source.getAttribute('href') || '');
		if (href) element.setAttribute('href', href);
	}

	for (const child of source.childNodes) appendSafeNode(child, element);
	target.appendChild(element);
};

export const getAdvertisementDescription = (advertisement) => {
	const content = advertisement?.ad_content?.trim();
	if (content) {
		const parsed = new DOMParser().parseFromString(content, 'text/html');
		const sanitized = document.createElement('div');
		for (const child of parsed.body.childNodes) appendSafeNode(child, sanitized);
		if (sanitized.innerHTML.trim()) return sanitized.innerHTML;
	}

	return advertisement?.unit?.summary?.join(', ') || '';
};

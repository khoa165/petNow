import "bootstrap";
import "../plugins/flatpickr"

import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

import { initTooltip } from '../components/footer';
initTooltip();

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();


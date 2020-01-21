import hljs from 'highlight.js/lib/highlight';
import javascript from 'highlight.js/lib/languages/javascript';

hljs.registerLanguage('javascript', javascript);
window.addEventListener('load', function(ev) {
  hljs.initHighlighting();
});
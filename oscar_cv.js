  let isDark = true;
  let currentMode = 'dev';

  function toggleTheme() {
    isDark = !isDark;
    document.getElementById('cvRoot').classList.toggle('dark-mode', isDark);
    document.getElementById('themeLabel').textContent = isDark ? 'Light' : 'Dark';
    document.getElementById('themeIcon').textContent = isDark ? '☀' : '☾';
  }

  function switchMode(mode) {
    currentMode = mode;
    const isDev = mode === 'dev';
    document.getElementById('btn-dev').classList.toggle('active', isDev);
    document.getElementById('btn-it').classList.toggle('active', !isDev);
    
    // Toggle main sections
    ['exp-dev', 'projects-dev', 'skills-dev'].forEach(id => {
      const el = document.getElementById(id);
      if (el) el.style.display = isDev ? '' : 'none';
    });
    ['exp-it', 'projects-it', 'skills-it'].forEach(id => {
      const el = document.getElementById(id);
      if (el) el.style.display = isDev ? 'none' : '';
    });

    // Update titles and summaries
    document.getElementById('cvTitle').textContent = isDev ? 'Software Engineer' : 'IT Specialist · Help Desk';
    document.getElementById('cvSummary').textContent = isDev
      ? 'Ingeniero de software con experiencia en desarrollo full-stack, coordinación de proyectos y QA. Especializado en la aplicación práctica de IA Generativa, LLMs, Prompt Engineering y RAG integrados en flujos reales de producción. Stack versátil con enfoque en soluciones escalables and bien documentadas.'
      : 'Profesional de TI con experiencia en soporte técnico avanzado, administración de redes, integración de hardware industrial y telecomunicaciones. Perfil integral orientado a la continuidad operativa y resolución de incidencias en entornos exigentes.';
    
    // Update document title for print/tab
    document.title = isDev ? 'CV — Oscar Francisco | Software Engineer' : 'CV — Oscar Francisco | IT Specialist';
  }

  function openEmailModal() { document.getElementById('emailModal').classList.add('open'); }
  function closeEmailModal() { document.getElementById('emailModal').classList.remove('open'); }
  function closeModal(e) { if (e.target === document.getElementById('emailModal')) closeEmailModal(); }
  
  function sendEmail() {
    const s = encodeURIComponent(document.getElementById('emailSubject').value || '');
    const b = encodeURIComponent(document.getElementById('emailBody').value || '');
    window.open('mailto:oscar.8a.fco@gmail.com?subject=' + s + '&body=' + b);
    closeEmailModal();
  }

  function toggleDropdown(e) { 
    e.stopPropagation(); 
    document.getElementById('phoneMenu').classList.toggle('open'); 
  }
  
  document.addEventListener('click', () => {
    const menu = document.getElementById('phoneMenu');
    if (menu) menu.classList.remove('open');
  });

  /**
   * Simplified print function that uses native browser printing.
   * This ensures the current theme (Light/Dark) and mode (Dev/IT) 
   * are captured exactly as seen on screen.
   */
  function printCV() {
    // The @media print rules in CSS will handle hiding UI elements
    window.print();
  }

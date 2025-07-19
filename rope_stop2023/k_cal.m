dictObj = Simulink.data.dictionary.open('data.sldd');
sectionObj = getSection(dictObj, 'Design Data');

L = getValue(getEntry(sectionObj, 'L'));
E = getValue(getEntry(sectionObj, 'E'));
damp = getValue(getEntry(sectionObj, 'damp'));
d = getValue(getEntry(sectionObj, 'd'));


k = pi * d * d * E /(4 * L)
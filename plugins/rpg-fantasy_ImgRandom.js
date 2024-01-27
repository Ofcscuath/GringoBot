import fetch from 'node-fetch'
let id_message, pp, dato, fake, user = null
let informacionCompras = {}
let contadorCompras = 1

let handler = async (m, { command, usedPrefix, conn }) => {
let who = m.mentionedJid && m.mentionedJid[0] ? m.mentionedJid[0] : m.fromMe ? conn.user.jid : m.sender
let fkontak = { "key": { "participants":"0@s.whatsapp.net", "remoteJid": "status@broadcast", "fromMe": false, "id": "Halo" }, "message": { "contactMessage": { "vcard": `BEGIN:VCARD\nVERSION:3.0\nN:Sy;Bot;;;\nFN:y\nitem1.TEL;waid=${m.sender.split('@')[0]}:${m.sender.split('@')[0]}\nitem1.X-ABLabel:Ponsel\nEND:VCARD` }}, "participant": "0@s.whatsapp.net" }

const jsonURL = 'https://raw.githubusercontent.com/GataNina-Li/module/main/imagen_json/anime.json'
try {
const response = await fetch(jsonURL)
const data = await response.json()

if (data.imagenesReclamadas && data.imagenesReclamadas.length > 0) {
dato = data.imagenesReclamadas[Math.floor(Math.random() * data.imagenesReclamadas.length)]
pp = await conn.profilePictureUrl(who, 'image').catch((_) => dato.urlImagen)
let info = `*⛱️ FANTASÍA RPG ⛱️*\n*⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯*\n✓ *Nombre:* ${dato.nombre}\n✓ *Origen:* ${dato.descripcion}\n✓ *Costo:* $${dato.costo}\n✓ *Estado:* Libre\n✓ *Clase:* ${dato.clase}\n✓ *ID:* \`\`\`${dato.codigoImagen}\`\`\``

id_message = (await conn.sendFile(m.chat, dato.urlImagen, 'error.jpg', info, fkontak, true, {
contextInfo: {
'forwardingScore': 200,
'isForwarded': false,
externalAdReply: {
showAdAttribution: false,
title: `${conn.getName(m.sender)}`,
body: `${dato.descripcion}`,
mediaType: 1,
sourceUrl: accountsgb.getRandom(),
thumbnailUrl: pp
}}
}, { caption: 'imagen_info' })).key.id
} else {
console.error('No se han encontrado imágenes.')
conn.sendMessage(m.chat, 'Error al obtener o procesar los datos.', { quoted: m })
}} catch (error) {
console.error('Error al obtener o procesar los datos: ', error)
conn.sendMessage(m.chat, 'Error al procesar la solicitud.', { quoted: m })
}}

/*handler.before = async (m) => {
let user = global.db.data.users[m.sender]
if (m.quoted && m.quoted.id === id_message && ['c', '🛒', '🐱'].includes(m.text.toLowerCase())) {
const cantidadFaltante = user.money - dato.costo
if (user.money < dato.costo) {
fake = { contextInfo: { externalAdReply: {title: `¡Insuficientes ${rpgshop.emoticon('money')}!`, body: `😼 Completa misiones del RPG`, sourceUrl: accountsgb.getRandom(), thumbnailUrl: gataMenu.getRandom() }}}
conn.reply(m.chat, `Te falta *${cantidadFaltante} ${rpgshop.emoticon('money')}* para comprar a *${dato.nombre}*\n\n*Actualmente tiene ${user.money} ${rpgg.emoticon('money')}*`, m, fake, )
} else {
user.money -= dato.costo
fake = { contextInfo: { externalAdReply: {title: `¡Disfruta de tú personaje!`, body: `${dato.descripcion}`, sourceUrl: accountsgb.getRandom(), thumbnailUrl: dato.urlImagen }}}
conn.reply(m.chat, `El usuario *${conn.getName(m.sender)}* ha comprado a *${dato.nombre}*`, m, fake, )
}}*/

handler.before = async (m) => {
user = global.db.data.users[m.sender]
if (!user.fantasy) user.fantasy = {}
if (m.quoted && m.quoted.id === id_message && ['c', '🛒', '🐱'].includes(m.text.toLowerCase())) {
const cantidadFaltante = dato.costo - user.money

if (user.money < dato.costo) {
fake = { contextInfo: { externalAdReply: { title: `¡Insuficientes ${rpgshop.emoticon('money')}!`, body: `😼 Completa misiones del RPG`, sourceUrl: accountsgb.getRandom(), thumbnailUrl: gataMenu.getRandom() } } }
conn.reply(m.chat, `Te falta *${cantidadFaltante} ${rpgshop.emoticon('money')}* para comprar a *${dato.nombre}*\n\n*Actualmente tienes ${user.money} ${rpgshop.emoticon('money')}*`, m, fake)
} else {
const indiceCompra = obtenerProximoIndice(user.fantasy);
const compraActual = {
Nombre: dato.nombre,
Origen: dato.descripcion,
Costo: dato.costo,
Clase: dato.clase,
ID: dato.codigoImagen,
Imagen: dato.urlImagen,
like: false,
Estado: true,
}

if (user.fantasy[indiceCompra]) {
const comprasAnteriores = { ...user.fantasy };
const indicesNumericos = Object.keys(comprasAnteriores).map(indice => parseInt(indice.match(/\d+/)[0]))
let nuevoIndiceNumerico = 1
while (indicesNumericos.includes(nuevoIndiceNumerico)) {
nuevoIndiceNumerico++
}
const nuevoIndice = `index${nuevoIndiceNumerico}`
user.fantasy = {
...comprasAnteriores,
[nuevoIndice]: { ...compraActual },
}} else {
user.fantasy[indiceCompra] = compraActual;
}
  
user.money -= dato.costo
fake = { contextInfo: { externalAdReply: { title: `¡Disfruta de tú personaje!`, body: `${dato.descripcion}`, sourceUrl: accountsgb.getRandom(), thumbnailUrl: dato.urlImagen } } }
conn.reply(m.chat, `El usuario *${conn.getName(m.sender)}* ha comprado a *${dato.nombre}*`, m, fake)
console.log("Contenido de user.fantasy:", user.fantasy)
}}
}
handler.command = /^(fantasy|fy)$/i
export default handler

function obtenerProximoIndice(fantasy) {
if (!fantasy || Object.keys(fantasy).length === 0) {
return 'index1'
}
const indices = Object.keys(fantasy)
const ultimoIndice = indices.reduce((max, indice) => {
const numero = parseInt(indice.match(/\d+/)[0])
return numero > max ? numero : max
}, 0)
return `index${ultimoIndice + 1}`;
}




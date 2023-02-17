const string = '!S'


export function saveData (key, value) {
    if (typeof value === 'string') {
        value = JSON.stringify({[string]: value})
    }

    JSON.stringify(value)
    localStorage.setItem(key, value)
}


export function getData (key) {
    const item = key && localStorage.getItem(key)
    let value = item && JSON.parse(item)

    return value && value[string] ? value[string] : value
}


export function setDefaultData (key, value) {
    if (!getData(key)) {
        saveData(key, value)
    }
}

export default function getReadingTime (text, wordsPerMinute = 125) {
    const words = text.split(' ').length

    return Math.ceil(words / wordsPerMinute)
}

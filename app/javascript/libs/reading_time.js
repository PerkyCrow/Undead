export default function getReadingTime (text, wordsPerMinute = 100) {
    const words = text.split(' ').length

    return Math.ceil(words / wordsPerMinute)
}

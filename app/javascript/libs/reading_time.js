export default function getReadingTime (text, wordsPerMinute = 130) {
    const words = text.split(' ').length

    return Math.ceil(words / wordsPerMinute)
}

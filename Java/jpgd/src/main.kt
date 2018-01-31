import java.awt.image.BufferedImage
import java.awt.image.DataBufferByte
import java.io.*
import java.net.URL
import javax.imageio.ImageIO

/**
 * Created by Jan Stoltman on 11/16/17.
 * stoltmanjan@gmail.com
 */
fun main(args: Array<String>) {
    var settingsPath: String = "settings.txt"
    if (args.isNotEmpty()) {
        settingsPath = args[0]
    }

    val setting: Setting? = readSettings(settingsPath)
    setting?.let {
        val urls: List<URL>? = readUrlsFile(setting.urlsPath)
        urls?.let {
            do {
                urls.forEach { url -> saveImage(readImage(url), createSavePath(setting, url)) }
                println("Zapisano jeden cykl")
                Thread.sleep(setting.sleepPeriod)
            } while (true)
        }
    }
}

private fun createSavePath(setting: Setting, url: URL) = setting.savePath + extractFilename(url)

private fun extractFilename(url: URL) = if (url.toString().matches(Regex(".*(.jpg)|(.png)|(.jpeg)"))) {
    url.toString().split("/").last()
} else {
    url.toString().split("/").last().replace("?",".") + ".jpg"
}

fun readSettings(path: String): Setting? {
    try {
        val reader = FileReader(path)
        val list = reader.readLines()
        reader.close()
        return Setting(list[0], list[1].toLong(), list[2])
    } catch (e: FileNotFoundException) {
        println("Nie znaleziono pliku konfiguracyjnego: " + path)
        return null
    } catch(e: IndexOutOfBoundsException) {
        println("Plik konfiguracyjny jest nieprawidłowy. Oczekiwany format to:\nPlik z linkami\nPrzerwa między cylami(milisekundy)\nFolder zapisu")
        return null
    }
}

fun readUrlsFile(path: String): List<URL>? {
    try {
        val reader = FileReader(path)
        val list = reader.readLines().map { u -> URL(u) }
        if (list.isEmpty()) {
            println("Nie znaleziono linków do pobrania")
        }
        reader.close()
        return list
    } catch (e: FileNotFoundException) {
        println("Nie znaleziono pliku z linkami: " + path)
        return null
    }
}

fun readImage(url: URL): BufferedImage? {
    try {
        val image = ImageIO.read(url)
        return image
    } catch(e: IOException) {
        println("Błąd przy pobieraniu obrazu: " + url.toString())
        return null
    }
}

fun saveImage(image: BufferedImage?, path: String) {
    if (image == null) return

    try {
        val fos = FileOutputStream(path)
        val dataBuffer: DataBufferByte = image.raster.dataBuffer as DataBufferByte

        fos.write(dataBuffer.data)
        fos.close()

        val file: File = File(path)
        ImageIO.write(image, path.split(".").last(), file)
    } catch(e: IOException) {
        println("Błąd przy zapisywaniu obrazu do: " + path)
    }
}

data class Setting(val urlsPath: String, val sleepPeriod: Long, val savePath: String)

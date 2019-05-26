
import org.apache.pdfbox.pdmodel.PDDocument
import org.apache.pdfbox.pdmodel.PDPage
import org.apache.pdfbox.pdmodel.common.PDRectangle
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject
import org.apache.pdfbox.pdmodel.PDPageContentStream
import org.apache.pdfbox.pdmodel.PDPageContentStream.AppendMode
import java.io.File
import org.apache.pdfbox.pdmodel.font.PDType1Font

var workDir = System.getenv("WRKDIR")
println(workDir)

val document = PDDocument.load(File("${workDir}/out.pdf"))
val page = PDPage(PDRectangle.A4)
document.addPage(page)

PDPageContentStream(document, page, AppendMode.APPEND, true, true).use { pageStream ->
    pageStream.beginText()
    val fontSize : Float = 12f
    pageStream.setFont(PDType1Font.TIMES_ROMAN, fontSize)
    pageStream.showText("Ceci est un test d'insertion de texte fait avec Kotlin pododo.")
    pageStream.endText()
}

document.save("${workDir}/test.pdf");
document.close();
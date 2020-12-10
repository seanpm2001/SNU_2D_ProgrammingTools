1// list_folders.kts
2import java.io.File
3val folders = File(args[0]).listFiles { file -> file.isDirectory() }
4folders?.forEach { folder -> println(folder) }


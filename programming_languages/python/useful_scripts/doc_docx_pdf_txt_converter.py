import shutil
import sys
from pathlib import Path
from pprint import pprint

import docx2txt
from pdfminer.high_level import extract_text


if sys.platform == "win32":
    import win32com.client as win32
    from win32com.client import constants


def collect_all_document_files():
    path = Path(__file__).parent.resolve()
    files = list(path.glob("*"))
    files = [file for file in files if file.suffix in [".doc", ".docx", ".pdf"]]
    return files, path


def convert_doc_to_docx(file, text_directory):
    # Opening MS Word
    # print(f"{file.name} converting from doc to docx")  # TESTCODE:
    word = win32.gencache.EnsureDispatch("Word.Application")
    doc = word.Documents.Open(str(file))
    doc.Activate()
    new_path = file.parent / f"{file.stem}.docx"
    word.ActiveDocument.SaveAs(str(new_path), FileFormat=constants.wdFormatXMLDocument)
    doc.Close(False)
    # print("Finished docx conversion") # TESTCODE:
    return new_path


def convert_docx_to_txt(file, text_directory):
    text = docx2txt.process(file)
    text = text.replace("\t", "")
    file_txt = text_directory / f"{file.stem}.txt"
    file_txt.touch()
    file = open(file_txt, "w", encoding="utf-8")
    file.write(text)
    file.close()


def convert_to_txt(parent_path):
    text_directory = parent_path / "converted_text_files"
    text_directory.mkdir(parents=True, exist_ok=True)
    files = list(parent_path.glob("*"))
    # files = files[0:30]  # TESTCODE:
    for file in files:
        if file.suffix == ".docx":
            convert_docx_to_txt(file, text_directory)
        elif file.suffix == ".doc":
            if sys.platform == "win32":
                try:
                    docx_path = convert_doc_to_docx(file, text_directory)
                    convert_docx_to_txt(docx_path, text_directory)
                except AttributeError:
                    import win32com
                    print(f"""There was an issue while converting a .doc document. To help with this issue do the following:
navigate to this location {win32com.__gen_path__} and delete any folders that are contained inside then run the script again""")
                except:
                    print(
                        f"{file.name} encountered an error while trying to convert the file to docx. You can try and open this file manually in Microsoft Word and then save as a .docx file then you can run the script again to convert this file to a text document."
                    )
            else:
                print(
                    f".doc files cannot be converted unless you are using Windows. {file.name} will not be converted"
                )
        elif file.suffix == ".pdf":
            text = extract_text(str(file))
            if len(text.strip()) == 0:
                print(f"{file.name} has no text in the pdf and was probably scanned")
            else:
                file_txt = text_directory / f"{file.stem}.txt"
                file_txt.touch()
                file = open(file_txt, "w", encoding="utf-8")
                file.write(text)
                file.close()
        # else:  # TESTCODE:
        #     print(f"{file.name} is not a .doc, .docx, or .pdf file. It will not be converted.")


filenames, parent_path = collect_all_document_files()
convert_to_txt(parent_path)

# %%
# This will load the modules and if it is not installed it will install it using pip
module = ["pathlib", "docx2txt", "pprint"]

def install_and_import(module):
    for module in module:
        import importlib
        try:
            importlib.import_module(module)
            print(module, "imported")
        except ImportError:
            import pip
            pip.main(['install', module])
            print(module, "installed")
        finally:
            globals()[module] = importlib.import_module(module)
            print(module, "imported")

install_and_import(module)

# this gets the docx files in the local folder
p = pathlib.Path(__file__).parent
files = p.glob("*.docx")

# this will cycle through all docx files and convert them to txt files
for file in files:
    text = docx2txt.process(file)
    text = text.replace("\t", "")
    file_txt = file.parent / "converted"
    file_txt.mkdir(parents=True, exist_ok=True)
    filenmame = file.stem + ".txt"
    file_txt = file_txt / filenmame
    file_txt.touch()
    file = open(file_txt, "w", encoding="utf-8")
    file.write(text)
    file.close()

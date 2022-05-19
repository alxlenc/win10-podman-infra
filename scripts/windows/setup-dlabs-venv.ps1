python -m venv .venv-win
.venv-win\Scripts\activate
pip install -r requirements.txt --extra-index-url https://pypi.apps.tools.dev.nextcle.com/repository/labs/simple
pip install -e . --extra-index-url https://pypi.apps.tools.dev.nextcle.com/repository/labs/simple
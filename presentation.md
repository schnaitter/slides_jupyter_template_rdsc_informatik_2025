---
width: 1920
height: 1080
title: A Jupyter Book Template for Research-Based Open Educational Resources in Data Literacy
author: Hannes Schnaitter¹, Evgenia Samoilova², Lamia Islam²
institute: ¹Humboldt-Universität zu Berlin; ²Universität Potsdam
slidenumber: true
theme: simple
bibliography: references.bib
---

# Agenda

::: notes

Today I will present to you our work on the Template and design decisions we
use to create our OER using Jupyter Book.

:::

**Requirements**

::: notes

In the next 15 minutes I will first present the requirements we identified for
our OER creation.

:::

**Jupyter Book**

::: notes

Then I will describe how Jupyter Book fulfills these requirements and where we
needed to expand or modify the standard behavior for our needs.

:::

**The Template**

::: notes

The bulk of the talk will be to show our design decisions and their
implementation in the template. I will show you how the template can be used to
create your own OER and how to use it for reference while writing.

:::

**Future Work**

::: notes

I will close the talk with a look into the future of our template and the
Jupyter Book ecosystem and its use for OER creation.

:::

# Requirements

::: notes

Our goal was to create Open Educational Resources that are easy to use, reuse,
and modify. The OER should also be able to seamlessly use multiple programming
environments.

- ease of use
- ease of reuse
- ease of modification
- multiple Jupyter kernels

:::

## Context QUADRIGA

::: incremental

- 12 case studies across multiple author teams
- different requirements based on specific audience and focused competencies
- consistency between case studies with allowances for individualization
- project based learning demonstrates applicability and usefulness of material to learners
  :::
  ::: notes

QUADRIGA is creating 12 case studies in total across 3 author teams. They each
have different requirements based on the specific audience they want to address
and the competencies they focus on.

Overall the books should be recognizably created by QUADRIGA to make the use of
multiple OER easier. Still they should allow for the author’s individualizations.

The case studies are each (a part of) a research process that demonstrate the
tools and methods used in similar kinds of research. This allows for example /
project based learning and demonstrates the applicability and usefulness of the
material to prospective learners/users.

:::

## Usage Scenarios

. . .

**focus on doctoral students, post-docs and other scientists**

::: notes

The main audience of the OER are researchers new to data science concepts in
the addressed disciplines (digital humanities with focus on text, administration
science, and film studies). We specifically address doctoral students,
post-docs and profs.

Other audiences like teachers and OER authors are partially addressed because
we and the case study authors are part of that group.

:::

---

### Learning

::: incremental

- **ease of use**
- **flexibility of learning**

- **depth of use:**
    - reading
    - interactivity
    - interacting with code
    - making code your own

:::

::: notes

Learners in our intended audience are already proficient in their discipline
but want to become more data literate. They are capable of structuring their
own learning process but to do that effectively they need to be able to choose
the appropriate learning depth adapted to their needs.

The depth scale identified starts with reading and progresses through
interactive exercises within Jupyter Book or on a Jupyter Host like Binder all
the way to working in their own environment (local Jupyter Hub or their local
machine) and even adapting the resources to their own data and problems. This
scale is reminiscent of Blooms Taxonomy.

:::

---

### Teaching

::: incremental

- **ease of reuse**
    - useful content and exercises
    - extracting parts and adapting them should be easy

:::

::: notes

To use the OER in teaching interesting content and exercises should be provided
and teachers should have the ability to extract parts of the OER and easily
adapt them to their needs.

:::

---

### Writing

::: incremental

- **ease of modification**
    - enable authors to realize their intent
    - easy to use after short introduction

:::

::: notes

While writing the case studies the technology should allow for the realization
of the authors intent while not being difficult to use.

Some learning of the technology can be expected but after a short introduction
the technology should be mostly invisible for routine authoring tasks.

:::

---

## (Executable) Code

::: incremental

- integration of code examples and their results
- choice of programming language
- similarity to real "research environment"

:::

::: notes

One very important requirement for the technology is the ability to integrate
code examples and their results seamlessly.

The authors should not be hindered in the choice of the programming language
they want to use.

Ideally the real „development environment“ they use for their research should
be used to author the case studies.

:::

---

## Open Development

- Open Educational Resource
- Open Formats
- No special execution environment / euntime prerequisites
- Development can be observed and contributed to
- Open Source

. . .

**Practice what you preach.**

::: notes

The development should also happen in the open (as open as possible). This means
the file formats should not necessitate proprietary software or have specific
requirements for its execution environment.

Using and editing the case studies as well as following the development should
require as few resources of the the user as possible.

This demonstrates the adherence to Open Principles: Practice what you preach.

:::

# Jupyter Book

## Alternatives

- Moodle
- Quarto
- LiaScript
- Folder(s) of Jupyter Notebooks

::: notes

Based on the requirements we looked at different technologies. Among others we
looked at Moodle, Quarto, LiaScript, Jupyter Notebooks, and of course Jupyter
Book. In the end Jupyter Book seemed to be the best option to fulfill all
requirements.

:::

## Jupyter Book Characteristics

::: incremental

- static site generator
- structure of content and links between pages
- Jupyter Notebooks (`.ipynb`) and Markdown (`.md`) files
- clear bi-directional connection between source files and pages of website

:::

::: notes

Jupyter Book is a static site generator that has a great integration
with the Jupyter ecosystem.

It allows for the use of Jupyter Notebooks and Markdown files to define pages
and to structure them into a website with a table of contents and links between
pages.

The Markdown dialect MyST allows for executable Markdown files which makes them
(more or less) equivalent to `.ipynb` files.

The main advantage is that there is a very clear connection between the website
and the underlying `.md` and `.ipynb` files. This connection is not only visible
in the repository and the table of contents definition (`_toc.yml`) but also
on the individual webpages via links to the code and to execution environments.

:::

# The Template

::: notes

- Architecture
- Python scripts
- GitHub Actions & Pages
- Zenodo Integration
- metadata

:::

## Architecture

---

### File Structure

**Configuration files**

```console
/_config.yml      # Jupyter Book configuration
/_toc.yml         # Jupyter Book Table of Contents (ToC)
```

**Building the Book**

```console
/requirements.txt # Python requirements. Other requirements based for other kernels possible.
/.github/         # GitHub configuration for Actions and Issues
/_build/          # Build artifacts
```

**Content**

```console
/einleitung.md    # Entrypoint as defined in ToC. Can be renamed.
/_static/         # Static files like CSS and JS
/**.md            # Markdown files in paths defined in ToC
/**.ipynb         # Jupyter Notebooks in paths defined in ToC
/references.bib   # BibTeX references
/*other*          # Assets like data or images
```

**QUADRIGA specific**

```console
/quadriga/        # Python scripts and configuration files used across the case studies
/metadata.yml     # QUADRIGA metadata file
/CITATION.cff     # Citation information for GitHub and Zenodo
```

---

### Editing Workflow

::: incremental

- Edit content
- Maybe edit `_config.yml`, `_toc.yml`
- Maybe clean previous build with `jb clean .` or `jb clean --all .`
- Build site with `jb build .`
- Look at result in `_build/html`
- Commit and push to GitHub

:::

::: notes
Locally editing means that one edits a content file and then rebuilds the book. While
only editing one page the author can use `jb build .` to only rebuild files that changed.
If something was changed that affects all pages (titles of the page, the toc, …), one
first needs to clean the `_build` folder with `jb clean .`.

Results of running the executable code in content files is also cached and can be rebuild
by first running `jb clean --all .` before building again with `jb build .`.

The results can be opened in a web browser either via the `file://` protocoll or for
example by using the python module `http.server` to access them via `http://localhost:8000`
(or similar).
:::

---

### Using Git

::: incremental

- Basic Git usage is viable for everyone.
- Avoid situations where manual merging is necessary.
- If manual merge is necessary, provide support.

:::

::: notes

Git usage for not too technically minded people.

Allow editing of main branch.

Try to not get into situations where manual merging is necessary. Support for
those merges by other project members.

:::

## Python Scripts

- Color Definitions (for Jupyter Quiz)
- Metadata Handling

::: notes

For quick scripts we use the package JupyterQuiz which integrates nicely with Jupyter Book.
To have consistent colors we define them in `quadriga.colors`.

:::

---

### Metadata Scripts

![](./assets/metadata-flowchart.mermaid.svg)

::: notes

The Python module `quadriga.metadata` contains scripts that updated the files `metadata.yml`,
`CITATION, cff`, and `CITATION.bib` based on information contained in `_config.yml`,
`_toc.yml`, and `metadata.yml`. All metadata updating can be done by running
`python3 -m quadriga.metadata.run_all` (requires `dev-requirements.txt`).

:::

## GitHub Actions & Pages

::: notes

The Book_Template currently uses GitHub as its Git forge and CI/CD pipeline. These workflows
and settings can also be run on any other Git forge and CI/CD pipeline.

:::

- GitHub Pages
- GitHub Actions
    - Metadata
    - Building the Book

::: notes

The generated books are currently hosted on GitHub Pages. Other hosting providers are possible
and might be implemented in the future.

:::

---

### GitHub Actions

![](./assets/gh-actions-flowchart.mermaid.svg){style="max-width: 80%; max-height: 70vh; object-fit: contain;"}

::: notes

The CI/CD infrastructure is defined in two GitHub Actions. One workflow is run on any commit
to any branch and updates the metadata files if necessary. If the author didn't update the
metadata locally before the push this action automatically creates a new commit in the branch.
This ensures up to date metadata files.

The second action is run on pushes to `main` if the action to update the metadata was successful.
In the template there are three versions of this workflow definition and users should select the
one fitting their requirements. They differe based on the Jupyter Kernels used in the book.

The template runs the workflow that contains setup instructions for Python, R, and SPARQL.
These setups are cached to ensure usable CI/CD runtimes.

:::

## Zenodo Integration

- Connect GitHub and Zenodo
- Create version tag and then create release
- Automatic preprocessing and updating of metadata
- Zenodo creates publication

::: notes

The Zenodo integration is documented quite well on <zenodo.org>.

Once GitHub and Zenodo are connected Zenodo watches selected GitHub Repositories and is notified
when a release is created. This triggers the download of the current state of `main` which is
then uploaded and published as a `.zip` file. The information within `CITATION.cff` is used to
populate the metadata of the Zenodo record.

On the first publishing the DOI created by Zenodo needs to be added to the relevant metadata
files in the repository and a Zenodo badge needs to be added to the `README.md`.

The GitHub Action to update the metadata also looks for the definition of a Git tag defining a
version. If it find this tag, it updates the metadata files with the `oer-version` and the
`date-modified` and then moves the tag to this newest automatically generated commit. Thus a
release based on this tag contains the updated and correct metadata.

:::

## Metadata

::: notes

QUADRIGA is working on an internal metadata scheme (or profile) which is used within the
project but can also be used by external projects or scrapers. It is defined in JSON-Schema.

It contains among other elements the definition of learning objectives per chapter and their
classification within the QUADRIGA Data Literacy Framework.

:::

## First Steps

::: notes

The Book_Template is itself a OER about building OER based on our ideas. It contains
instructions for configuring Jupyter Book and authoring content.

It can be used as is or as a starting point or inspiration for creating your own OER.

:::

# Future Work

::: notes

- enhance QUADRIGA scripts
- evaluation
- Jupyter book 2
- more/better to assessments (more quiz types, …)

:::

## Enhancing QUADRIGA Scripts

- enhance metadata handling
- maybe tool in the style of teachbooks

::: notes

Remove duplication, especially in the definition of learning objectives.

Tool like teachbooks enhances cohesiveness but not sure if the added layer of abstraction is good.

:::

## Evaluation

::: notes

- How easy is onboarding authors?
- Does the structure of Jupyter Book support / enhance learning?
- How good are the case studies? (Learning outcomes)

:::

## More Assessment Options

- drag‘n‘drop quizzes to allow for mapping and ordering exercises
- interactive plot based assessment

## Jupyter Book 2

- re-architecture based on MyST.md instead of sphinx
- depending on tooling the finished case studies will be ported (or not)
- bifurcation of template for both versions possible

# References

::: {#refs}
:::

# Project Partners & Funding

## QUADRIGA

## Funding

<!-- vim: set spelllang=en_us spell: -->

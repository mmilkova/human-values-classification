# Human Values Classification in Russian Social Media

This repository contains Python scripts and models accompanying the study:
**"Detecting Basic Values in A Noisy Russian Social Media Text Data: A Multi-Stage Classification Framework"**.

We analyze how human values are expressed in public VKontakte (VK) posts, drawing on Schwartz’s theory of basic human values. Our pipeline includes filtering, GPT-based annotation, and supervised multi-label classification using transformer models.

---

## Repository Structure

```
1_Crawling_and_Preprocessing/
  1_VK_Crawling                # Crawling text posts from random users via VK API 
  2_Preprocessing              # General preprocessing, 
  3_Spam_Filtering             # Spam and non-peronal content filtering

2_Binary_Classification/
  1_FineTuning_RuBert_tiny           # Fine-tuning Rubert-tiny2 model + train SVM to classify if the posts is value-expressive
  2_PoliticalClassification          # Classifying politically-oriented posts
  3_Value-ExpressiveClassification   # Classifying value-expressive posts

3_Annotation_GPT_and_Experts
  1_gpt-api-prompt                  # prompt to use gpt-4 to annotate data on ten values
  2_experts_vs_chatgpt              # accuracy and agreement analysis of gpt and human annotations


4_Multilabel_Classification/
  1_FineTuning-BERT-model             # Fine-tuning xlm-roberta-large model for multi-label classification
  2_MakePredictionsWithNewData        # Inference on unlabeled posts
  3_Processing_byValues               # Base analysis of predicted data 


data/                             # Examples of annotations, fragment of predicted scores, **(Rubert-tiny2-fine-tuned embeddings hosted on Zenodo)** (no raw texts)
models/                           # Trained classification models (**full xlm-roberta-large model hosted on Zenodo**)
dictionaries/                     # Custom pattern dictionaries (for spam filtering and political classification)

```

## Pretrained Models and Embeddings (Zenodo)

Two pretrained artifacts are available via Zenodo:

- **Rubert-tiny2 fine-tuned embeddings** used for binary classification (value-expression detection)
- **XLM-RoBERTa-large model** fine-tuned for multilabel classification of human values
  
[https://doi.org/10.5281/zenodo.15801230](https://doi.org/10.5281/zenodo.15801230)
---

## Getting Started

To reproduce the classification pipeline:

1. Run crawling and preprocessing (see 1\_Crawling\_and\_Preprocessing/)
2. Filter posts using value- and political classifiers
3. Annotate posts with GPT or use `gpt-api-prompt/`
4. Download the pretrained multilabel classification model (XLM-RoBERTa-large) from Zenodo 
   and place it in the `models/` folder.  
   [Download here](https://doi.org/10.5281/zenodo.15801230)

---

## Data Availability

* We **do not** publish raw VK post texts due to ethical constraints.
* Hashed IDs, annotations, and aggregated soft labels are provided.
* See `README_data.md` for more.

Researchers may request access to full data under a data usage agreement. Contact the corresponding author with institutional affiliation and research purpose.

---

## License and Ethical Use

Code is released under the MIT license. Use of models and data is permitted for **non-commercial academic research only**. Governmental and commercial use is prohibited. See `ETICAL_USE.md` for more.

---

## Citation

If you use this code or data, please cite:

> BLINDED  (2025). Detecting Basic Values in A Noisy Russian Social Media Text Data: A Multi-Stage Classification Framework. Journal of Computational Social Science (under review).

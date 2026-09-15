# Human Values Classification in Russian Social Media

This repository contains the main code and analysis components used in the study
**"Structure of Basic Human Values in Russian Social Media"**.

---

## Repository Structure

```
1_Crawling_and_Preprocessing/
  1_VK_Crawling                # Crawling text posts from random users via VK API 
  2_Preprocessing              # General preprocessing, 
  3_Spam_Filtering             # Spam and non-personal content filtering

2_Binary_Classification/
  1_FineTuning_RuBert_tiny           # Fine-tuning Rubert-tiny2 model + train SVM to classify if the posts is value-expressive
  2_PoliticalClassification          # Classifying politically-oriented posts
  3_Value-ExpressiveClassification   # Classifying value-expressive posts

3_Annotation_GPT_and_Experts
  0_gpt-api-prompt_binary_annotation     # prompt to use gpt-3.5-turbo to annotate whether posts express any value 
  MultilabelAnnotation                    # Different prompt configurations for multilabel annotation (gpt-4, gpt-5, gemini-2.5-pro)


4_Multilabel_Classification/
  FineTuning_XLM-RoBERTa               # Fine-tuning xlm-roberta-large model for multi-label classification
  XLM_RoBERTa_evaluation               # PR-AUC, Spearman correlations, Cumulative distribution
  LLM_configurations_comparison        # model-prompt confidurations vaidation
  MultidimensionalScaling             # R script for MultidimensionalScaling
  Corpus-level-analysis               # Corpus-level analysis: Aggregate value-expression profile, structure of value co-expression



models/                           # some classification models (**xlm-roberta-large model hosted on Zenodo**)
dictionaries/                     # Custom pattern dictionaries (for spam filtering and political classification)

```

## Pretrained Models and Embeddings (Zenodo)  # Repository BLINDED for double-blind review

Two pretrained artifacts are available via Zenodo:

- **Rubert-tiny2 fine-tuned embeddings** used for binary classification (value-expression detection)
- **XLM-RoBERTa-large model** fine-tuned for multilabel classification of human values
---

## Data Availability

* We **do not** publish raw VK post texts due to ethical constraints.
* See `README_data.md` for more.

---

## License and Ethical Use

The code is distributed under the MIT License. Because the models concern inferences about human value expression, we strongly discourage their use for individual profiling, surveillance, social scoring, censorship, or
discriminatory decision making.. See `ETHICAL_USE.md` for more.

---



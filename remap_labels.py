import os

# Desired IDs for each class folder
CLASS_ID = {
    "person": 0,
    "cup": 1,
    "ball": 2,
    "pen": 3,
    "pencil": 4,
}

# Base path to labels (relative to this file)
LABELS_DIR = "labels"

splits = ["train", "val"]

for split in splits:
    split_dir = os.path.join(LABELS_DIR, split)

    for class_name, new_id in CLASS_ID.items():
        class_dir = os.path.join(split_dir, class_name)

        if not os.path.isdir(class_dir):
            continue

        for fname in os.listdir(class_dir):
            if not fname.endswith(".txt"):
                continue

            txt_path = os.path.join(class_dir, fname)

            with open(txt_path, "r") as f:
                lines = f.readlines()

            updated = []
            for line in lines:
                parts = line.strip().split()
                if len(parts) < 5:
                    continue

                # Force the label to match the folder's assigned ID
                parts[0] = str(new_id)
                updated.append(" ".join(parts) + "\n")

            with open(txt_path, "w") as f:
                f.writelines(updated)

print("Label remap complete.")

# -*- coding: UTF-8 -*-
import numpy as np
import copy


def readdata(filename):
    # 打开指定文件，读取文件中的数据，将每一行以逗号为分隔符转换为列表，然后将所有行组成的列表转换为NumPy数组。
    # 返回处理后的数据集。
    file = open(filename)
    dataset = []
    for line in file.readlines():
        line = line.strip('\n')
        list_line = line[:].split(',')
        dataset.append(list_line)
    dataset = np.array(dataset)
    return dataset


def joint_distribution(joint_set, dataset_a, a):
    # 计算给定数据集 dataset_a 和联合分布集合 joint_set 的联合分布。
    # 返回一个包含联合分布的NumPy数组。
    lookup_joint = {}
    joint_distri = np.zeros((1, len(joint_set)))
    for index_joint_set, item_joint_set in enumerate(joint_set):  # enumerate可以同时获得索引和值
        temp1 = ""
        for item_pi in item_joint_set:  # joint_set(1),joint_set(2),……
            temp1 += str(item_pi)  # +=用于连接两个可迭代对象（如字符串、列表等），也可以进行数值相加
        lookup_joint[temp1] = index_joint_set
        # 中括号——list；str(joint_set(1)),str(joint_set(1)joint_set(2)),……；0，1，2，……
    for item in dataset_a:  # dataset_a(1),dataset_a(2),……
        key_item = ""
        for i in range(a):  # 0，1
            key_item += str(item[i])
        joint_distri[0][lookup_joint[key_item]] += 1  # 出现多几次就不是1/len(dataset_a)了
    joint_distri = joint_distri / len(dataset_a)
    return joint_distri


def joint_Set(k, joint_init, joint_set, joint_temp):  # 通过递归生成联合分布joint_init中各个属性可能的取值组合，并将其添加到 joint_set 中。
    if k == len(joint_init):
        temp = copy.deepcopy(joint_temp)
        joint_set.append(temp)
    else:
        for i in range(len(joint_init[k])):
            joint_temp[k] = joint_init[k][i]
            joint_Set(k + 1, joint_init, joint_set, joint_temp)

# 通过梯度生成联合分配中各个属性可能的取值组合，把其添加到中joint_set。

def A_Num_Set(filename):
    file = open(filename)
    dataset_Atr = []
    for line in file.readlines():
        line = line.strip('\n')
        line_list = line[:].split(',')
        dataset_Atr.append(line_list)
    dataset_Atr.append(['<=50K', '>50K'])
    A_num_set = []
    lookup_Acontinues = {0: 5, 2: 7, 4: 5, 10: 6, 11: 2, 12: 7}  # 把1，3，5，11，12，13列连续的数据用范围内数字表达
    for i in range(len(dataset_Atr)):  # 矩阵的行数
        if i != 0 and i != 2 and i != 10 and i != 11 and i != 12 and i != 4:
            A_num_set.append(len(dataset_Atr[i]))
        else:
            A_num_set.append(lookup_Acontinues[i])
    return A_num_set

# 从指定文件中读取数据，处理后返回一个包含各属性可能取值数量的列表。

def joint_distribution_old_or_new_2(a, d, dataset_old_ornew):
    A_num_set = A_Num_Set("adult_property.data")
    joint_distri_set = []
    for i in range(d - 1):
        for j in range(i + 1, d):
            dataset_a = []
            x = dataset_old_ornew[:, i]
            y = dataset_old_ornew[:, j]
            dataset_a.append(x)
            dataset_a.append(y)
            dataset_a = np.transpose(np.array(dataset_a))
            joint_init = []  # 存放联合分布中各个属性可能的取值
            joint_temp = [0] * a  # 存放递归中每层联合分布的取值  # 0重复a遍
            joint_set = []
            for index_a in range(a):
                temp = []
                if index_a == 0:
                    for index_0 in range(int(A_num_set[i])):
                        temp.append(index_0)
                    joint_init.append(temp)
                if index_a == 1:
                    for index_0 in range(int(A_num_set[j])):
                        temp.append(index_0)
                    joint_init.append(temp)
            joint_Set(0, joint_init, joint_set, joint_temp)
            joint_distri_set.append(joint_distribution(joint_set, dataset_a, a))
    return joint_distri_set

# 计算给定数据dataset_old_ornew集中前两个属性的所有可能的二元联合分配

def joint_distribution_old_or_new_3(a, d, dataset_old_ornew):
    A_num_set = A_Num_Set("adult_property.data")
    joint_distri_set = []
    for i in range(d - 2):
        for j in range(i + 1, d - 1):
            for k in range(j + 1, d):
                dataset_a = []
                x = dataset_old_ornew[:, i]
                y = dataset_old_ornew[:, j]
                z = dataset_old_ornew[:, k]
                dataset_a.append(x)
                dataset_a.append(y)
                dataset_a.append(z)
                dataset_a = np.transpose(np.array(dataset_a))
                joint_init = []  # 存放联合分布中各个属性可能的取值
                joint_temp = [0] * a  # 存放递归中每层联合分布的取值
                joint_set = []
                for index_a in range(a):
                    temp = []
                    if index_a == 0:
                        for index_0 in range(int(A_num_set[i])):
                            temp.append(index_0)
                        joint_init.append(temp)
                    if index_a == 1:
                        for index_0 in range(int(A_num_set[j])):
                            temp.append(index_0)
                        joint_init.append(temp)
                    if index_a == 2:
                        for index_0 in range(int(A_num_set[k])):
                            temp.append(index_0)
                        joint_init.append(temp)
                joint_Set(0, joint_init, joint_set, joint_temp)
                joint_distri_set.append(joint_distribution(joint_set, dataset_a, a))
    return joint_distri_set

# 计算给定数据dataset_old_ornew集中前三个属性的所有可能的三元联合分配

def main(a, d):
    dataset_old = readdata("dataset_binary.txt")
    dataset_new = readdata("dataset_new.txt")
    joint_distri_set_old = joint_distribution_old_or_new_3(a, d, dataset_old)
    joint_distri_set_new = joint_distribution_old_or_new_3(a, d, dataset_new)
    n = len(joint_distri_set_new)
    aver_var_dist = 0
    aver_distance = 0
    for i in range(n):
        joint_distri_set_old[i] = np.fabs(joint_distri_set_old[i] - joint_distri_set_new[i])
        aver_var_dist += np.max(joint_distri_set_old[i])
    aver_var_dist /= n
    print(aver_var_dist)

# 通过调用上述函数，计算两个数据集（dataset_old和dataset_new）的三元联合分布的方差。
# 输出平均变异差（aver_var_dist）

main(2, 14)  # 全局

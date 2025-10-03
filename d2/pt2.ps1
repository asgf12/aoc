#! /usr/bin/env pwsh

# func
function main{
# todo
}

# vars
$data = get-content -raw $args
$data = $data.split("`n") # | foreach {$_.trim()}
$incr = $null
$aarr = @{}

# $data[0]

# making hastable key value for each line
for (($i = 0); $i -le ($data.length - 2); $i++) {
    $aarr.add($i, [array[]]$data[$i])
    # write-output WE DONE IT
}

# TODO add logic, I guess in functions




# $aarr.0 | get-member
#    TypeName: System.Object[]
# Available methods for $aarr
# Name           MemberType            Definition
# ----           ----------            ----------
# Add            Method                int IList.Add(System.Object value)
# Address        Method                System.Object&, System.Private.CoreLib, Version=9.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e Address(int )
# Clear          Method                void IList.Clear()
# Clone          Method                System.Object Clone(), System.Object ICloneable.Clone()
# CompareTo      Method                int IStructuralComparable.CompareTo(System.Object other, System.Collections.IComparer comparer)
# Contains       Method                bool IList.Contains(System.Object value)
# CopyTo         Method                void CopyTo(array array, int index), void CopyTo(array array, long index), void ICollection.CopyTo(array array, int index)
# Equals         Method                bool Equals(System.Object obj), bool IStructuralEquatable.Equals(System.Object other, System.Collections.IEqualityComparer comparer)
# Get            Method                System.Object Get(int )
# GetEnumerator  Method                System.Collections.IEnumerator GetEnumerator(), System.Collections.IEnumerator IEnumerable.GetEnumerator()
# GetHashCode    Method                int GetHashCode(), int IStructuralEquatable.GetHashCode(System.Collections.IEqualityComparer comparer)
# GetLength      Method                int GetLength(int dimension)
# GetLongLength  Method                long GetLongLength(int dimension)
# GetLowerBound  Method                int GetLowerBound(int dimension)
# GetType        Method                type GetType()
# GetUpperBound  Method                int GetUpperBound(int dimension)
# GetValue       Method                System.Object GetValue(Params int[] indices), System.Object GetValue(int index), System.Object GetValue(int index1, int index2), System.Object GetValue(int index1, int index…
# IndexOf        Method                int IList.IndexOf(System.Object value)
# Initialize     Method                void Initialize()
# Insert         Method                void IList.Insert(int index, System.Object value)
# Remove         Method                void IList.Remove(System.Object value)
# RemoveAt       Method                void IList.RemoveAt(int index)
# Set            Method                void Set(int , System.Object )
# SetValue       Method                void SetValue(System.Object value, int index), void SetValue(System.Object value, int index1, int index2), void SetValue(System.Object value, int index1, int index2, int ind…
# ToString       Method                string ToString()
# Item           ParameterizedProperty System.Object IList.Item(int index) {get;set;}
# Count          Property              int Count {get;}
# IsFixedSize    Property              bool IsFixedSize {get;}
# IsReadOnly     Property              bool IsReadOnly {get;}
# IsSynchronized Property              bool IsSynchronized {get;}
# Length         Property              int Length {get;}
# LongLength     Property              long LongLength {get;}
# Rank           Property              int Rank {get;}
# SyncRoot       Property              System.Object SyncRoot {get;}



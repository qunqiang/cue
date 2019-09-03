// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go k8s.io/apimachinery/pkg/runtime

package runtime

// TypeMeta is shared by all top level objects. The proper way to use it is to inline it in your type,
// like this:
// type MyAwesomeAPIObject struct {
//      runtime.TypeMeta    `json:",inline"`
//      ... // other fields
// }
// func (obj *MyAwesomeAPIObject) SetGroupVersionKind(gvk *metav1.GroupVersionKind) { metav1.UpdateTypeMeta(obj,gvk) }; GroupVersionKind() *GroupVersionKind
//
// TypeMeta is provided here for convenience. You may use it directly from this package or define
// your own with the same fields.
//
// +k8s:deepcopy-gen=false
// +protobuf=true
// +k8s:openapi-gen=true
TypeMeta :: {
	// +optional
	apiVersion?: string @go(APIVersion) @protobuf(1,bytes,opt)

	// +optional
	kind?: string @go(Kind) @protobuf(2,bytes,opt)
}

ContentTypeJSON ::     "application/json"
ContentTypeYAML ::     "application/yaml"
ContentTypeProtobuf :: "application/vnd.kubernetes.protobuf"

// RawExtension is used to hold extensions in external versions.
//
// To use this, make a field which has RawExtension as its type in your external, versioned
// struct, and Object in your internal struct. You also need to register your
// various plugin types.
//
// // Internal package:
// type MyAPIObject struct {
//  runtime.TypeMeta `json:",inline"`
//  MyPlugin runtime.Object `json:"myPlugin"`
// }
// type PluginA struct {
// AOption string `json:"aOption"`
// }
//
// // External package:
// type MyAPIObject struct {
//  runtime.TypeMeta `json:",inline"`
//  MyPlugin runtime.RawExtension `json:"myPlugin"`
// }
// type PluginA struct {
// AOption string `json:"aOption"`
// }
//
// // On the wire, the JSON will look something like this:
// {
// "kind":"MyAPIObject",
// "apiVersion":"v1",
// "myPlugin": {
//  "kind":"PluginA",
//  "aOption":"foo",
// },
// }
//
// So what happens? Decode first uses json or yaml to unmarshal the serialized data into
// your external MyAPIObject. That causes the raw JSON to be stored, but not unpacked.
// The next step is to copy (using pkg/conversion) into the internal struct. The runtime
// package's DefaultScheme has conversion functions installed which will unpack the
// JSON stored in RawExtension, turning it into the correct object type, and storing it
// in the Object. (TODO: In the case where the object is of an unknown type, a
// runtime.Unknown object will be created and stored.)
//
// +k8s:deepcopy-gen=true
// +protobuf=true
// +k8s:openapi-gen=true
RawExtension :: _

// Unknown allows api objects with unknown types to be passed-through. This can be used
// to deal with the API objects from a plug-in. Unknown objects still have functioning
// TypeMeta features-- kind, version, etc.
// TODO: Make this object have easy access to field based accessors and settors for
// metadata and field mutatation.
//
// +k8s:deepcopy-gen=true
// +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object
// +protobuf=true
// +k8s:openapi-gen=true
Unknown :: _

// VersionedObjects is used by Decoders to give callers a way to access all versions
// of an object during the decoding process.
//
// +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object
// +k8s:deepcopy-gen=true
VersionedObjects :: {
	// Objects is the set of objects retrieved during decoding, in order of conversion.
	// The 0 index is the object as serialized on the wire. If conversion has occurred,
	// other objects may be present. The right most object is the same as would be returned
	// by a normal Decode call.
	Objects: [...Object] @go(,[]Object)
}

Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp7391129ywe;
        Thu, 7 Mar 2019 15:44:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqw98P6B0OBpnp7EXl+9w9yhDRYU9VUyjGDCQ3kOPH6SajtpFunC3iuoTqxowp4k/AAe89i8
X-Received: by 2002:a63:6545:: with SMTP id z66mr14062139pgb.182.1552002267455;
        Thu, 07 Mar 2019 15:44:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552002267; cv=none;
        d=google.com; s=arc-20160816;
        b=qtRWBnQlOychBXQP7UrOLklpf4dDoYL0as4kYux7dV/jyUZgdbKX7NDX+EQFVHtAqq
         n+8KYL/ljHXJYrcbi1cr0xGAGHSOjSjTpd+0zmrFwzBSRy+4Pii/xD9si/25717/exOP
         7DMJD20xr5mF5QmNtjxz2k8Uu82Uon1/AXEzQ9iBpOtSUGmimVCKExugx0CzC+E07w1u
         K/kz1LByhDQDjgkHw0c1FxYhE8PhuBMnVKCncbKR/N2Wu0l6P6YbLfWB4VSmrHEM3aBX
         uQ81MS1ZN5SOpvEuEzb8f44s16MdSp6aTITIhAdJdP5elR7LgzYTbfof7oyALwn1htP4
         l1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=p38yg/cvVBDXwiY/z6rNC2s9k1adqRl8VzxVfeeS5CM=;
        b=vCffouOa5QWkL0GIy2EXiD6EC+SNQmmWSKblaaMWC17S3eL2gLQQk2YIsl4WGCGAdu
         OGJQBVYfQ62OMrIei8DS8pSk9GHY29wYtyj2hGt/gHKh/4Nr8wenynhBg6HrbqEN0hcl
         ZuSJFZO367Ysbnz9NbOImeG3ORGnmusgI7KinACx8UaOsTiEtK1Agguv9cAEYw9xgPPY
         DbIuKP7uz84J9VHik+y9/hSTewvOE0kTuNyPmr3/tLEjC9oZfhAyroMEhbY2bynjrFNR
         b94HogSYnhrikZa60RKuNDDLlmZeDzcbxYsI1YW7eE2+4WzyDFKJArvp9QRscZJ13z61
         MbMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id v24si1818071pgl.334.2019.03.07.15.44.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2019 15:44:27 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892456E24E;
	Thu,  7 Mar 2019 23:44:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB436E24A;
 Thu,  7 Mar 2019 23:44:25 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Mar 2019 15:44:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,453,1544515200"; d="scan'208";a="171478919"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga001.jf.intel.com with ESMTP; 07 Mar 2019 15:44:24 -0800
Date: Thu, 7 Mar 2019 15:44:35 -0800
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PULL] gvt-fixes for 5.1-rc1
Message-ID: <20190307234435.GB13329@intel.com>
References: <20190307060810.GT12380@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190307060810.GT12380@zhen-hp.sh.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>, "Lv, Zhiyuan" <zhiyuan.lv@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXIgMDcsIDIwMTkgYXQgMDI6MDg6MTBQTSArMDgwMCwgWmhlbnl1IFdhbmcgd3Jv
dGU6Cj4gCj4gSGksCj4gCj4gSGVyZSdzIGd2dC1maXhlcyBmb3IgNS4xLXJjMS4KCkknbSBraW5k
IG9mIGNvbmZ1c2VkIGhlcmUuIHRoaXMgc2hvdWxkIGJlIC1uZXh0LWZpeGVzIHJpZ2h0PwoKJCBk
aW0gYXBwbHktcHVsbCBkcm0taW50ZWwtbmV4dC1maXhlcwoKUHVsbGluZyBodHRwczovL2dpdGh1
Yi5jb20vaW50ZWwvZ3Z0LWxpbnV4LmdpdCB0YWdzL2d2dC1maXhlcy0yMDE5LTAzLTA3IC4uLgpG
cm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9ndnQtbGludXgKICogdGFnICAgICAgICAgICAg
ICAgICAgICAgICAgIGd2dC1maXhlcy0yMDE5LTAzLTA3IC0+IEZFVENIX0hFQUQKZGltOiBQdWxs
IHJlcXVlc3QgY29udGFpbnMgY29tbWl0cyBmcm9tIGRybS9kcm0tZml4ZXMKZGltOiBQbGVhc2Ug
YmFja21lcmdlIGZpcnN0CmRpbTogRVJST1I6IElzc3VlcyBpbiBwdWxsIHJlcXVlc3QgZGV0ZWN0
ZWQsIGFib3J0aW5nCgpvciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nPwoKVGhhbmtzLApSb2RyaWdv
LgoKPiBUaGlzIGNvbnRhaW5zIGZpeGVzIGZvciBuZXdlcgo+IHZlcnNpb24gb2YgV2luZG93cyBk
cml2ZXIsIGUuZyBmaXggcGFyc2VyIGZvciBNSV9GTFVTSF9EVyBhbmQKPiBmb250IHJlbmRlciBl
cnJvci4gQW5kIHdpdGggb3RoZXIgc3RhYmxlIGZpeCBpbiBlcnJvciBwYXRoLAo+IGZpeCB1bmV4
cGVjdGVkIHdvcmtsb2FkIHN1Ym1pc3Npb24gd2hlbiB2R1BVIGlkbGUsIGV0Yy4gRGV0YWlscwo+
IGFyZSBiZWxvdy4KPiAKPiBUaGFua3MKPiAtLQo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5j
ZSBjb21taXQgMGY3NTU1MTIxNjA5MTIyM2VmZTFmMTgyOTVmNjU1YWZmNjQxNTM4NToKPiAKPiAg
IGRybS9pOTE1L2d2dDogcmVsZWFzZSBzaGFkb3cgYmF0Y2ggYnVmZmVyIGFuZCB3YV9jdHggYmVm
b3JlIGRlc3Ryb3kgb25lIHdvcmtsb2FkICgyMDE5LTAxLTIzIDEzOjU4OjQ2ICswODAwKQo+IAo+
IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+IAo+ICAgaHR0cHM6Ly9n
aXRodWIuY29tL2ludGVsL2d2dC1saW51eC5naXQgdGFncy9ndnQtZml4ZXMtMjAxOS0wMy0wNwo+
IAo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA3MmFhYmZiODYyZTQwZWU4M2MxMzZj
NGY4Nzg3N2MyMDdlNjg1OWI3Ogo+IAo+ICAgZHJtL2k5MTUvZ3Z0OiBBZGQgbXV0dWFsIGxvY2sg
Zm9yIHBwZ3R0IG1tIExSVSBsaXN0ICgyMDE5LTAzLTA0IDE0OjQ1OjI4ICswODAwKQo+IAo+IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPiBndnQtZml4ZXMtMjAxOS0wMy0wNwo+IAo+IC0gRml4IE1JX0ZMVVNIX0RXIGNtZCBw
YXJzZXIgb24gaW5kZXggY2hlY2sgKFpoZW55dSkKPiAtIEZpeCBXaW5kb3dzIGd1ZXN0IGZvbnQg
cmVuZGVyIGVycm9yIChDb2xpbikKPiAtIEZpeCB1bmV4cGVjdGVkIHdvcmtsb2FkIHN1Ym1pc3Np
b24gZm9yIGluYWN0aXZlIHZHUFUgKFdlaW5hbikKPiAtIEZpeCBpbmNvcnJlY3Qgd29ya2xvYWQg
c3VibWlzc2lvbiBpbiBlcnJvciBwYXRoIChaaGVueXUpCj4gLSBGaXggd2FybmluZyBmb3Igc2hh
ZG93IHBwZ3R0IG1tIHJlY2xhaW0gbGlzdCB3YWxrIHdpdGggbG9ja2luZyAoWmhlbnl1KQo+IAo+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiBDb2xpbiBYdSAoMSk6Cj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBBZGQgaW4gY29u
dGV4dCBtbWlvIDB4MjBEOCB0byBnZW45IG1taW8gbGlzdAo+IAo+IFdlaW5hbiBMaSAoMSk6Cj4g
ICAgICAgZHJtL2k5MTUvZ3Z0OiBzdG9wIHNjaGVkdWxpbmcgd29ya2xvYWQgd2hlbiB2Z3B1IGlz
IGluYWN0aXZlCj4gCj4gWmhlbnl1IFdhbmcgKDQpOgo+ICAgICAgIGRybS9pOTE1L2d2dDogRml4
IE1JX0ZMVVNIX0RXIHBhcnNpbmcgd2l0aCBjb3JyZWN0IGluZGV4IGNoZWNrCj4gICAgICAgZHJt
L2k5MTUvZ3Z0OiBEb24ndCBzdWJtaXQgcmVxdWVzdCBmb3IgZXJyb3Igd29ya2xvYWQgZGlzcGF0
Y2gKPiAgICAgICBkcm0vaTkxNS9ndnQ6IE9ubHkgYXNzaWduIHBwZ3R0IHJvb3QgYXQgZGlzcGF0
Y2ggdGltZQo+ICAgICAgIGRybS9pOTE1L2d2dDogQWRkIG11dHVhbCBsb2NrIGZvciBwcGd0dCBt
bSBMUlUgbGlzdAo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jICAg
fCAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgICAgICAgICAgfCAxNCAr
KysrKysrKysrKysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmggICAgICAgICAg
fCAgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvX2NvbnRleHQuYyB8ICAxICsK
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jICAgIHwgMjggKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyks
IDEwIGRlbGV0aW9ucygtKQo+IAo+IAo+IC0tIAo+IE9wZW4gU291cmNlIFRlY2hub2xvZ3kgQ2Vu
dGVyLCBJbnRlbCBsdGQuCj4gCj4gJGdwZyAtLWtleXNlcnZlciB3d3drZXlzLnBncC5uZXQgLS1y
ZWN2LWtleXMgNEQ3ODE4MjcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2ludGVsLWd2dC1kZXY=

Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3489516ywo;
        Tue, 16 Apr 2019 00:29:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxMagzbztqaes1wUVpJfAvwP6UTl42fpKQnaDqGcNazpkUSMAV91Ce+gl9qUAwn2FAToYLF
X-Received: by 2002:a17:902:8d8b:: with SMTP id v11mr80270302plo.133.1555399749604;
        Tue, 16 Apr 2019 00:29:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555399749; cv=none;
        d=google.com; s=arc-20160816;
        b=bzPYOB5GLW9Y5E2RrWftGN/GMAuPfZpZgWw5WGU4AfFmuCd2yQi0TZJUJdov5aa9JB
         TMiqVNdXiq3IN5mdAO2CKFuVR2cpgZmv0rzalVbwncGbUG0rLhh7cLON960IH3mtGpCY
         2iuPuMtq8xdLwfdt9Kk3cyeiRFwHiU+rWBvCQHHBOozmoSrTYQYXPJVlMBHxOIoyqInB
         JsF8tMwcrYbVVKqxIUKtSftBY9nn9TdF3oilil8UWswit5hErmXfCYso7sD7ks3mXsdn
         I4koZYPLoBIb5LKhkypG9LjfjzN94NLa06jKxBIqOPjjRa+5K6W6FlWdBEKEfI37+8i2
         +A+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:date:subject:user-agent:message-id:references
         :in-reply-to:organization:from:to:mime-version:delivered-to;
        bh=LTPn0uW16DJQ5rt0pMlA8EGzDORtCAj21K066UHMXs0=;
        b=sCSPn1ZRkR7zBnbW6iDoMijhlK0+q6fi5DAdemwkm3jhLs35Ho4q6DeM6nqzEKu24X
         UiYxiYTAwB/gUn5E4LlHjBzyHgHq18KIn6cMsbbgrLlsyAEFHZvP4Xl3XrZbveR/WF2D
         0HgWJp3tLH0l8w2bG+wbJv4OnwqY2Ww+eqZ5ugYGdusHrfXaYMahIQfZ4cdZtTOsW8w+
         T25mM43k9XYkwHfetwFqMxDVlStqoShmj0Y0Btl6g2Sd+DlK48hEbTSztCbjCXZ5YRSW
         2ozJeuB/N4KwtRZi/M5nGCWB4n0greAtHAXw9KtxjzbSwYSj+ve2evAgcXCTcvzppNmF
         RRyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id z123si44067443pgb.199.2019.04.16.00.29.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2019 00:29:09 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB2E89A67;
	Tue, 16 Apr 2019 07:29:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A2789A67;
 Tue, 16 Apr 2019 07:29:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Apr 2019 00:29:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,355,1549958400"; d="scan'208";a="338005097"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.10.3])
 by fmsmga005.fm.intel.com with ESMTP; 16 Apr 2019 00:29:04 -0700
MIME-Version: 1.0
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
In-Reply-To: <20190409040500.GM17995@zhen-hp.sh.intel.com>
References: <20190409040500.GM17995@zhen-hp.sh.intel.com>
Message-ID: <155539974336.31447.265673967377405617@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.7
Subject: Re: [PULL] gvt-next
Date: Tue, 16 Apr 2019 10:29:03 +0300
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv, 
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SSdtIGdldHRpbmcgYW4gZXJyb3Igd2hpbGUgcHVsbGluZyB0aGlzLCBjb3VsZCB5b3UgY2hlY2sg
aXQ6CgogIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2d2dC1saW51eAogICAqIHRhZyAg
ICAgICAgICAgICAgICAgICAgICAgICBndnQtbmV4dC0yMDE5LTA0LTA5IC0+IEZFVENIX0hFQUQK
ICBkaW06IDY2YmQ5ZjY5ZDYxNSAoImRybS9pOTE1L2d2dDogYWRkcmVzc2VkIGd1ZXN0IEdQVSBo
YW5nIHdpdGggSFdTIGluZGV4IG1vZGUiKTogRml4ZXM6IFNIQTEgaW4gbm90IHBvaW50aW5nIGF0
IGFuIGFuY2VzdG9yOgogIGRpbTogICAgIDU0OTM5ZWEwYmQ4NSAoImRybS9pOTE1OiBTd2l0Y2gg
dG8gdXNlIEhXUyBpbmRpY2VzIHJhdGhlciB0aGFuIGFkZHJlc3NlcyIpCiAgZGltOiBFUlJPUjog
aXNzdWVzIGluIGNvbW1pdHMgZGV0ZWN0ZWQsIGFib3J0aW5nCgpCZXN0IFJlZ2FyZHMsCkpvb25h
cwoKUXVvdGluZyBaaGVueXUgV2FuZyAoMjAxOS0wNC0wOSAwNzowNTowMCkKPiAKPiBIaSwKPiAK
PiBUaGlzIGluY2x1ZGVzIHZhcmlvdXMgY29kZSByZWZpbmVtZW50IGFuZCBjbGVhbnVwcywgd2l0
aCBwcm9wZXIKPiBhc3luYy9zeW5jIGRpc3BsYXkgZmxpcCBoYW5kbGluZywgYW5kIGFsc28gc29t
ZSBjaGFuZ2VzIHJlcXVpcmVkCj4gZm9yIHJlY2VudCBkcm0taW50ZWwtbmV4dCBhcyBndWVzdCBr
ZXJuZWwsIGRldGFpbHMgYmVsb3cuCj4gCj4gVGhhbmtzCj4gLS0KPiBUaGUgZm9sbG93aW5nIGNo
YW5nZXMgc2luY2UgY29tbWl0IGEwMWIyYzZmNDdkODZjN2QxYTlmYTgyMmIzYjkxZWMyMzNiNjE3
ODQ6Cj4gCj4gICBkcm0vaTkxNTogVXBkYXRlIERSSVZFUl9EQVRFIHRvIDIwMTkwMzI4ICgyMDE5
LTAzLTI4IDE0OjQxOjU1ICswMjAwKQo+IAo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBv
c2l0b3J5IGF0Ogo+IAo+ICAgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2d2dC1saW51eC5naXQg
dGFncy9ndnQtbmV4dC0yMDE5LTA0LTA5Cj4gCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVw
IHRvIDIwMWUzZTg1ODBiYjQ5MjRkMGNjMjlmYzM4NDFlYTU3ODI0MDFiNDY6Cj4gCj4gICBkcm0v
aTkxNS9ndnQ6IEZpeCBpbmNvcnJlY3QgbWFzayBvZiBtbWlvIDB4MjIwMjggaW4gZ2VuOC85IG1t
aW8gbGlzdCAoMjAxOS0wNC0wMyAxNjozNzoyMCArMDgwMCkKPiAKPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gZ3Z0LW5l
eHQtMjAxOS0wNC0wOQo+IAo+IC0gUmVmaW5lIHJhbmdlIG9mIE1DSEJBUiBzbmFwc2hvdCAoWWFr
dWkpCj4gLSBSZWZpbmUgb3V0LW9mLXN5bmMgcGFnZSBzdHJ1Y3QgKFlha3VpKQo+IC0gUmVtb3Zl
IHVudXNlZCB2R1BVIHNyZWcgKFlhbikKPiAtIFJlZmluZCBNTUlPIHJlZyBuYW1lcyAoWGlhb2xp
bikKPiAtIFByb3BlciBoYW5kbGluZyBvZiBzeW5jL2FzeW5jIGZsaXAgKENvbGluKQo+IC0gUHJv
cGVyIGhhbmRsaW5nIG9mIFBJUEVfQ09OVFJPTC9NSV9GTFVTSF9EVyBpbmRleCBtb2RlIChYaWFv
bGluKQo+IC0gRVhDQyByZWcgbWFzayBmaXggKENvbGluKQo+IAo+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBDb2xpbiBY
dSAoNSk6Cj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBVc2UgY29uc2lzdCBtYXggZGlzcGxheSBwaXBl
IG51bWJlcnMgYXMgaTkxNSBkZWZpbml0aW9uCj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBBZGQgbWFj
cm8gZGVmaW5lIGZvciBtbWlvIDB4NTAwODAgYW5kIGd2dCBmbGlwIGV2ZW50Cj4gICAgICAgZHJt
L2k5MTUvZ3Z0OiBFbmFibGUgc3luY2hyb25vdXMgZmxpcCBvbiBoYW5kbGluZyBNSV9ESVNQTEFZ
X0ZMSVAKPiAgICAgICBkcm0vaTkxNS9ndnQ6IEVuYWJsZSBhc3luYyBmbGlwIG9uIHBsYW5lIHN1
cmZhY2UgbW1pbyB3cml0ZXMKPiAgICAgICBkcm0vaTkxNS9ndnQ6IEZpeCBpbmNvcnJlY3QgbWFz
ayBvZiBtbWlvIDB4MjIwMjggaW4gZ2VuOC85IG1taW8gbGlzdAo+IAo+IFhpYW9saW4gWmhhbmcg
KDIpOgo+ICAgICAgIGRybS9pOTE1L2d2dDogcmVwbGFjZWQgcmVnaXN0ZXIgYWRkcmVzcyB3aXRo
IG5hbWUKPiAgICAgICBkcm0vaTkxNS9ndnQ6IGFkZHJlc3NlZCBndWVzdCBHUFUgaGFuZyB3aXRo
IEhXUyBpbmRleCBtb2RlCj4gCj4gWWFuIFpoYW8gKDEpOgo+ICAgICAgIGRybS9pOTE1L2d2dDog
cmVtb3ZlIHRoZSB1bnVzZWQgc3JlZwo+IAo+IFpoYW8gWWFrdWkgKDIpOgo+ICAgICAgIGRybS9p
OTE1L2d2dDogUmVmaW5lIHRoZSBzbmFwc2hvcnQgcmFuZ2Ugb2YgSTkxNSBNQ0hCQVIgdG8gb3B0
aW1pemUgZ3Z0LWcgYm9vdCB0aW1lCj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBSZWZpbmUgdGhlIGNv
bWJpbmVkIGludGVsX3ZncHVfb29zX3BhZ2Ugc3RydWN0IHRvIHNhdmUgbWVtb3J5Cj4gCj4gWmhl
bnl1IFdhbmcgKDEpOgo+ICAgICAgIE1lcmdlIHRhZyAnZHJtLWludGVsLW5leHQtMjAxOS0wMy0y
OCcgaW50byBndnQtbmV4dAo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNl
ci5jICAgfCAgMzAgKysrKystCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmMg
ICAgICB8ICAgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyAgICAgICAgICB8
ICAgNyArKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmggICAgICAgICAgfCAgIDIg
Ky0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oICAgICAgICAgIHwgICA5ICstCj4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jICAgICB8IDE1OSArKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pby5j
ICAgICAgICAgfCAgIDggKy0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29udGV4
dC5jIHwgICA0ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9yZWcuaCAgICAgICAgICB8
ICAzNCArKysrKysrCj4gIDkgZmlsZXMgY2hhbmdlZCwgMTcyIGluc2VydGlvbnMoKyksIDgyIGRl
bGV0aW9ucygtKQo+IAo+IAo+IC0tIAo+IE9wZW4gU291cmNlIFRlY2hub2xvZ3kgQ2VudGVyLCBJ
bnRlbCBsdGQuCj4gCj4gJGdwZyAtLWtleXNlcnZlciB3d3drZXlzLnBncC5uZXQgLS1yZWN2LWtl
eXMgNEQ3ODE4MjcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1ndnQtZGV2

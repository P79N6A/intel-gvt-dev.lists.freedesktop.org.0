Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp4655805ywo;
        Tue, 16 Apr 2019 23:40:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw3m+RtW3exAoz14jBb+CsbtCKCUtB8GuAYSazN92Wm9a7yeiL1Mfs/mivfaa9jorEwbx4C
X-Received: by 2002:a17:902:2aa6:: with SMTP id j35mr30158103plb.236.1555483219462;
        Tue, 16 Apr 2019 23:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555483219; cv=none;
        d=google.com; s=arc-20160816;
        b=HXNxVSuDSCvb2D+ucsYsT8UVK8F/iwxe/ChtPAmiRldTB8eoBfs23scU+rhcpUyq2M
         wBBjmqQ5wBfAWdb60iwNopm3TX7/0l/CNHCWzYiL0oDHUZM3M21oFYf4j2fsD2yHP2Sj
         LgQ7bEZJPR8CC4/6XEKApqyW+zKkqoz0CJVT+FnpD/24M3hZwdlGt4f0I/vM42ZfzdKe
         WCf9HDWLQgbwAWml9ny5NTKvpOfO59mwFp8JkANVKjFx//Y/QsgfxK7he4o3COB+5IY1
         ME/CAmdSXxqimW7sP+/BGbEs7H43ICpsyHanx7eekJrh+SzORCmQc9vPOE4XnBGYbbMF
         357w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:date:subject:user-agent:message-id:references
         :in-reply-to:organization:from:to:mime-version:delivered-to;
        bh=tGD+RX1oW6sG+ulYzZ1+Z3EfmZQrF4uFMQDrD/c3xy8=;
        b=a/UXDFEGKs8P8IQmRCYGGGH2mOCuxbH18RR7851bnHY8fWjuYOBVoZk7SlZwoMDp7c
         nMO+BdhQhV5CxMaz3oqOxwXw/5jZpW3sNJsAtEGyM4coC+hDxwKb3bAFpYdOQtdaRRvZ
         P5LgFnrQ2TFHzk3xXwVyqYSP0EUz5gwxIskew/+kSoOgFgUdSh/Kq5j8/7PE1aX4Y8X2
         /IrNCKrNRVsNRSJvYOdh9SSa+9F1UQ8KYlB4kV1Vq0fEZ146ReJZMGbJUnbduaW4ykwQ
         bRIb4NSEQzy4mG4E/qmk4WgbekjI60i7/8IALt4G/j0YNB5v1ist1eW9WQVY7x9Q2t0X
         /WFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 4si34916047pfp.185.2019.04.16.23.40.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2019 23:40:19 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF8F89D81;
	Wed, 17 Apr 2019 06:40:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9ED89D81;
 Wed, 17 Apr 2019 06:40:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Apr 2019 23:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,360,1549958400"; d="scan'208";a="224230642"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.251.86.173])
 by orsmga001.jf.intel.com with ESMTP; 16 Apr 2019 23:40:09 -0700
MIME-Version: 1.0
To: Zhenyu Wang <zhenyuw@linux.intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
In-Reply-To: <20190416084814.GH17995@zhen-hp.sh.intel.com>
References: <20190409040500.GM17995@zhen-hp.sh.intel.com>
 <155539974336.31447.265673967377405617@jlahtine-desk.ger.corp.intel.com>
 <20190416084814.GH17995@zhen-hp.sh.intel.com>
Message-ID: <155548320834.5663.6187523383173487803@bngilmar-mobl2.ger.corp.intel.com>
User-Agent: alot/0.7
Subject: Re: [PULL] gvt-next
Date: Wed, 17 Apr 2019 09:40:08 +0300
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
 Zhenyu Wang <zhenyuw@linux.intel.com>, "Yuan, Hang" <hang.yuan@intel.com>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBaaGVueXUgV2FuZyAoMjAxOS0wNC0xNiAxMTo0ODoxNCkKPiBPbiAyMDE5LjA0LjE2
IDEwOjI5OjAzICswMzAwLCBKb29uYXMgTGFodGluZW4gd3JvdGU6Cj4gPiBJJ20gZ2V0dGluZyBh
biBlcnJvciB3aGlsZSBwdWxsaW5nIHRoaXMsIGNvdWxkIHlvdSBjaGVjayBpdDoKPiA+IAo+ID4g
ICBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9ndnQtbGludXgKPiA+ICAgICogdGFnICAg
ICAgICAgICAgICAgICAgICAgICAgIGd2dC1uZXh0LTIwMTktMDQtMDkgLT4gRkVUQ0hfSEVBRAo+
ID4gICBkaW06IDY2YmQ5ZjY5ZDYxNSAoImRybS9pOTE1L2d2dDogYWRkcmVzc2VkIGd1ZXN0IEdQ
VSBoYW5nIHdpdGggSFdTIGluZGV4IG1vZGUiKTogRml4ZXM6IFNIQTEgaW4gbm90IHBvaW50aW5n
IGF0IGFuIGFuY2VzdG9yOgo+ID4gICBkaW06ICAgICA1NDkzOWVhMGJkODUgKCJkcm0vaTkxNTog
U3dpdGNoIHRvIHVzZSBIV1MgaW5kaWNlcyByYXRoZXIgdGhhbiBhZGRyZXNzZXMiKQo+ID4gICBk
aW06IEVSUk9SOiBpc3N1ZXMgaW4gY29tbWl0cyBkZXRlY3RlZCwgYWJvcnRpbmcKPiA+IAo+IAo+
IFNvcnJ5IGZvciB0aGlzLCBJIGFwcGxpZWQgZ3Z0IGNoYW5nZSBlYXJsaWVyIHRoYW4gYmFjay1t
ZXJnZSBvbmUsIHdoaWNoIGNhdXNlZCB0aGlzLgo+IE5vdyBnZW5lcmF0ZWQgbmV3IG9uZSwgcGxz
IGhlbHAgdG8gcHVsbC4KClRoaXMgaXMgbm93IHB1bGxlZC4KClJlZ2FyZHMsIEpvb25hcwoKPiAK
PiBUaGFua3MuCj4gLS0KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDI4ZDYx
OGU5YWI4NmYyNmEzMWFmMGIyMzVjZWQ1NWJlYjNlMzQzYzg6Cj4gCj4gICBkcm0vaTkxNTogVXBk
YXRlIERSSVZFUl9EQVRFIHRvIDIwMTkwNDA0ICgyMDE5LTA0LTA0IDE3OjQzOjU4ICswMzAwKQo+
IAo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+IAo+ICAgaHR0cHM6
Ly9naXRodWIuY29tL2ludGVsL2d2dC1saW51eC5naXQgdGFncy9ndnQtbmV4dC0yMDE5LTA0LTE2
Cj4gCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDJiZmM0OTc1MDgzYWNlMGU1Nzc3
MTE2NTE0YzNhNzVlNTliM2RiY2Q6Cj4gCj4gICBkcm0vaTkxNS9ndnQ6IEZpeCBpbmNvcnJlY3Qg
bWFzayBvZiBtbWlvIDB4MjIwMjggaW4gZ2VuOC85IG1taW8gbGlzdCAoMjAxOS0wNC0xNiAxNjo1
Mjo1MSArMDgwMCkKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gZ3Z0LW5leHQtMjAxOS0wNC0xNgo+IAo+IC0gUmVm
aW5lIHJhbmdlIG9mIE1DSEJBUiBzbmFwc2hvdCAoWWFrdWkpCj4gLSBSZWZpbmUgb3V0LW9mLXN5
bmMgcGFnZSBzdHJ1Y3QgKFlha3VpKQo+IC0gUmVtb3ZlIHVudXNlZCB2R1BVIHNyZWcgKFlhbikK
PiAtIFJlZmluZCBNTUlPIHJlZyBuYW1lcyAoWGlhb2xpbikKPiAtIFByb3BlciBoYW5kbGluZyBv
ZiBzeW5jL2FzeW5jIGZsaXAgKENvbGluKQo+IC0gUHJvcGVyIGhhbmRsaW5nIG9mIFBJUEVfQ09O
VFJPTC9NSV9GTFVTSF9EVyBpbmRleCBtb2RlIChYaWFvbGluKQo+IC0gRVhDQyByZWcgbWFzayBm
aXggKENvbGluKQo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBDb2xpbiBYdSAoNSk6Cj4gICAgICAgZHJtL2k5MTUv
Z3Z0OiBVc2UgY29uc2lzdCBtYXggZGlzcGxheSBwaXBlIG51bWJlcnMgYXMgaTkxNSBkZWZpbml0
aW9uCj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBBZGQgbWFjcm8gZGVmaW5lIGZvciBtbWlvIDB4NTAw
ODAgYW5kIGd2dCBmbGlwIGV2ZW50Cj4gICAgICAgZHJtL2k5MTUvZ3Z0OiBFbmFibGUgc3luY2hy
b25vdXMgZmxpcCBvbiBoYW5kbGluZyBNSV9ESVNQTEFZX0ZMSVAKPiAgICAgICBkcm0vaTkxNS9n
dnQ6IEVuYWJsZSBhc3luYyBmbGlwIG9uIHBsYW5lIHN1cmZhY2UgbW1pbyB3cml0ZXMKPiAgICAg
ICBkcm0vaTkxNS9ndnQ6IEZpeCBpbmNvcnJlY3QgbWFzayBvZiBtbWlvIDB4MjIwMjggaW4gZ2Vu
OC85IG1taW8gbGlzdAo+IAo+IFhpYW9saW4gWmhhbmcgKDIpOgo+ICAgICAgIGRybS9pOTE1L2d2
dDogcmVwbGFjZWQgcmVnaXN0ZXIgYWRkcmVzcyB3aXRoIG5hbWUKPiAgICAgICBkcm0vaTkxNS9n
dnQ6IGFkZHJlc3NlZCBndWVzdCBHUFUgaGFuZyB3aXRoIEhXUyBpbmRleCBtb2RlCj4gCj4gWWFu
IFpoYW8gKDEpOgo+ICAgICAgIGRybS9pOTE1L2d2dDogcmVtb3ZlIHRoZSB1bnVzZWQgc3JlZwo+
IAo+IFpoYW8gWWFrdWkgKDIpOgo+ICAgICAgIGRybS9pOTE1L2d2dDogUmVmaW5lIHRoZSBzbmFw
c2hvcnQgcmFuZ2Ugb2YgSTkxNSBNQ0hCQVIgdG8gb3B0aW1pemUgZ3Z0LWcgYm9vdCB0aW1lCj4g
ICAgICAgZHJtL2k5MTUvZ3Z0OiBSZWZpbmUgdGhlIGNvbWJpbmVkIGludGVsX3ZncHVfb29zX3Bh
Z2Ugc3RydWN0IHRvIHNhdmUgbWVtb3J5Cj4gCj4gWmhlbnl1IFdhbmcgKDEpOgo+ICAgICAgIE1l
cmdlIHRhZyAnZHJtLWludGVsLW5leHQtMjAxOS0wNC0wNCcgaW50byBndnQtbmV4dAo+IAo+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jICAgfCAgMzAgKysrKystCj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNwbGF5LmMgICAgICB8ICAgMSAtCj4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9ndHQuYyAgICAgICAgICB8ICAgNyArKwo+ICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvZ3R0LmggICAgICAgICAgfCAgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2d2dC5oICAgICAgICAgIHwgICA5ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9oYW5kbGVycy5jICAgICB8IDE1OSArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pby5jICAgICAgICAgfCAgIDggKy0KPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29udGV4dC5jIHwgICA0ICstCj4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9yZWcuaCAgICAgICAgICB8ICAzNCArKysrKysrCj4gIDkgZmlsZXMg
Y2hhbmdlZCwgMTcyIGluc2VydGlvbnMoKyksIDgyIGRlbGV0aW9ucygtKQo+IAo+IAo+IC0tIAo+
IE9wZW4gU291cmNlIFRlY2hub2xvZ3kgQ2VudGVyLCBJbnRlbCBsdGQuCj4gCj4gJGdwZyAtLWtl
eXNlcnZlciB3d3drZXlzLnBncC5uZXQgLS1yZWN2LWtleXMgNEQ3ODE4MjcKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5n
IGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp2330885ywo;
        Tue, 2 Apr 2019 21:58:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyQ21qYpy5BRH50MCuasoHZES9zmmoiIsGQsMyQjHeAujftn0Zrg21US0aqAZzTApRHq7ox
X-Received: by 2002:a62:874d:: with SMTP id i74mr45708922pfe.211.1554267515250;
        Tue, 02 Apr 2019 21:58:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554267515; cv=none;
        d=google.com; s=arc-20160816;
        b=G0TDHs69kUksaBQ2+s0oEB5HX9cmJ6pB3yiB5lxQ+HjybKLoWBp9BSt5DtcF7bobL2
         gIjgxzaOYMPO5ZilqkA/DuFAH7lz9zqBl0JouSwWfk0DcRnrRznuPpuZ7fGjImb9ZIem
         /CH3v52SzeTFMRQf9embFupvRzjRnpHSXcluKAT2msbh5UyX/RU9XtKKBzrVa1Apg9GP
         mdZgFv681h4BOKvt4fJaydmM3KN0sbaGG4c1ojVl9bpIgnLdwik4S537+JDda5l92bod
         NFus9OqdKtcA31EqOfTq4dBCzDa/yDRF3nDxuktXt/mTi5VXSei2m9f/oBICfHsIiuok
         Z5Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:content-language:accept-language:references
         :message-id:date:thread-index:thread-topic:subject:to:from
         :delivered-to;
        bh=+S1YORfnu+lpH1ynXWukOPMlwrFE9vLPDHxyHOAB4nM=;
        b=HlyCLm2uXUDZBPzqWxW6/EM+XhoM0rgXauU5kVaw9P5Js0GneZp7OP0ddeZt9XcpGM
         mhORZiN+kjDaGSemILtGexTsRpiTQQufLKpKlSQjsTRNqI1C3NkFhkhKDlGVUTBhm3uy
         vngv08+WJnxNCt61qQmR0RWnXQsuMwI7Ikiwz1t7aDGn2BWRWRuRZ/VdYaB3vIRh53uV
         ntLE5v/ZyBmjk9XrQyUUetZEZDotMlsxki+XiC1MrNxUxH8AmiNT5OgIzRVUOKAIi5G5
         yiRT9HvgSGzeuQyHfsEDk6gV09BtggnjMnKD7VBOHOM45dnHkvBBw2FncY0vBVJx1M6L
         qLMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id u9si4658386plq.162.2019.04.02.21.58.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2019 21:58:35 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F386E812;
	Wed,  3 Apr 2019 04:58:34 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF436E812
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 Apr 2019 04:58:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Apr 2019 21:58:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,303,1549958400"; d="scan'208";a="128178876"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga007.jf.intel.com with ESMTP; 02 Apr 2019 21:58:32 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 2 Apr 2019 21:58:32 -0700
Received: from shsmsx107.ccr.corp.intel.com ([169.254.9.153]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.164]) with mapi id 14.03.0415.000;
 Wed, 3 Apr 2019 12:58:30 +0800
From: "Zhang, Xiaolin" <xiaolin.zhang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gvt: addressed guest GPU hang with HWS index mode
Thread-Topic: [PATCH] drm/i915/gvt: addressed guest GPU hang with HWS index
 mode
Thread-Index: AQHU6c07h7REgFqOqUG3ydy9OvPXJQ==
Date: Wed, 3 Apr 2019 04:58:30 +0000
Message-ID: <073732E20AE4C540AE91DBC3F07D446087645893@SHSMSX107.ccr.corp.intel.com>
References: <20190403033117.8289-1-xiaolin.zhang@intel.com>
 <20190403034821.GH2322@zhen-hp.sh.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.4.101]
MIME-Version: 1.0
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
Cc: "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gMDQvMDMvMjAxOSAxMTo1OSBBTSwgWmhlbnl1IFdhbmcgd3JvdGU6Cj4gT24gMjAxOS4wNC4w
MyAxMTozMToxNyArMDgwMCwgWGlhb2xpbiBaaGFuZyB3cm90ZToKPj4gd2l0aCB0aGUgaW50cm9k
dWNlIG9mICJzd2l0Y2ggdG8gdXNlIEhXUyBpbmRpY2VzIHJhdGhlciB0aGFuIGFkZHJlc3MiLAo+
PiBndWVzdCBHUFUgaGFuZyBvYnNlcnZlZCB3aGVuIHJ1bm5pbmcgd29ya2xvYWRzIHdoaWNoIHdp
bGwgdXBkYXRlIHRoZQo+PiBzZXFubyB0byB0aGUgcmVhbCBIVyBIV1NQLCBub3Qgdml0dXJhbCBH
UFUgSFdTUCBhbmQgdGhlbiBjYXVzZSBHUFUgaGFuZy4KPj4KPj4gdGhpcyBwYXRjaCBpcyB0byBy
ZXZva2UgaW5kZXggbW9kZSBpbiBQSVBFX0NUUkwgYW5kIE1JX0ZMVVNIX0RXIGFuZAo+PiBwYXRj
aCBndWVzdCBHUFUgSFdTUCBhZGRyZXNzIHZhbHVlIHRvIHRoZXNlIGNvbW1hbmRzLgo+Pgo+PiBG
aXhlczogNTQ5MzllYTBiKCJkcm0vaTkxNTogU3dpdGNoIHRvIHVzZSBIV1MgaW5kaWNlcyByYXRo
ZXIgdGhhbgo+PiBhZGRyZXNzZXMiKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBYaWFvbGluIFpoYW5n
IDx4aWFvbGluLnpoYW5nQGludGVsLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvY21kX3BhcnNlci5jIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKy0tLQo+PiAgMSBm
aWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYwo+PiBpbmRleCBiNDIwOTE5Mjc5YzcuLmY5NzY3
NzdkN2JkNSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJz
ZXIuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jCj4+IEBA
IC0xMDcwLDYgKzEwNzAsMTggQEAgc3RhdGljIHN0cnVjdCBjbWRfaW50ZXJydXB0X2V2ZW50IGNt
ZF9pbnRlcnJ1cHRfZXZlbnRzW10gPSB7Cj4+ICAJfSwKPj4gIH07Cj4+ICAKPj4gK3N0YXRpYyBp
bnQgaW5kZXhfbW9kZV90b19nbWEoc3RydWN0IHBhcnNlcl9leGVjX3N0YXRlICpzLCB1MzIgaW5k
ZXgpCj4+ICt7Cj4+ICsJdTMyIGdtYTsKPj4gKwl1MzIgdmFsOwo+PiArCj4+ICsJZ21hID0gcy0+
dmdwdS0+aHdzX3BnYVtzLT5yaW5nX2lkXSArIGluZGV4Owo+PiArCXBhdGNoX3ZhbHVlKHMsIGNt
ZF9wdHIocywgMiksIGdtYSk7Cj4+ICsJdmFsID0gY21kX3ZhbChzLCAxKSAmICh+UElQRV9DT05U
Uk9MX1NUT1JFX0RBVEFfSU5ERVgpOwo+PiArCXBhdGNoX3ZhbHVlKHMsIGNtZF9wdHIocywgMSks
IHZhbCk7Cj4gTUlfRkxVU0hfRFcgdXNlcyBkd29yZCAxIGZvciBHTUEgYWRkcmVzcyBvciBpbmRl
eCBpbnN0ZWFkIG9mIGR3b3JkIDIsIGFsdGhvdWdoCj4gaW5kZXggbW9kZSBmbGFnIGZvciB0aGVt
IGlzIGJvdGggYXQgZHdvcmQgMSwgYnV0IGFkZHJlc3Mgb2Zmc2V0IGlzIGRpZmZlcmVudCwKPiBh
bmQgTUlfRkxVU0hfRFcgaGFzIEdHVFQvUFBHVFQgZmxhZyB2YWx1ZSBpbiBkd29yZCAxIHdoaWNo
IHNob3VsZCBiZSBwcmVzZXJ2ZWQuCj4gTG9va3MgYmV0dGVyIGp1c3QgaGFuZGxlIGluIHRoZWly
IGhhbmRsZXJzLgp0aGFua3MgeW91ciBncmVhdCBwb2ludC4gSSBtaXNzZWQgdGhpcyBkZXRhaWwg
aW5mb3JtYXRpb24gaW4gbXkgcGF0Y2guCndpbGwgYmUgY29ycmVjdGVkIGluIHBhdGNoIFYyLgo+
Cj4+ICsJcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gIHN0YXRpYyBpbnQgY21kX2hhbmRsZXJfcGlw
ZV9jb250cm9sKHN0cnVjdCBwYXJzZXJfZXhlY19zdGF0ZSAqcykKPj4gIHsKPj4gIAlpbnQgZ21h
ZHJfYnl0ZXMgPSBzLT52Z3B1LT5ndnQtPmRldmljZV9pbmZvLmdtYWRyX2J5dGVzX2luX2NtZDsK
Pj4gQEAgLTEwOTgsOCArMTExMCwxMSBAQCBzdGF0aWMgaW50IGNtZF9oYW5kbGVyX3BpcGVfY29u
dHJvbChzdHJ1Y3QgcGFyc2VyX2V4ZWNfc3RhdGUgKnMpCj4+ICAJCQkJLyogU3RvcmUgRGF0YSBJ
bmRleCAqLwo+PiAgCQkJCWlmIChjbWRfdmFsKHMsIDEpICYgKDEgPDwgMjEpKQo+PiAgCQkJCQlp
bmRleF9tb2RlID0gdHJ1ZTsKPj4gLQkJCQlyZXQgfD0gY21kX2FkZHJlc3NfYXVkaXQocywgZ21h
LCBzaXplb2YodTY0KSwKPj4gLQkJCQkJCWluZGV4X21vZGUpOwo+PiArCQkJCWlmIChpbmRleF9t
b2RlKQo+PiArCQkJCQlyZXQgPSBpbmRleF9tb2RlX3RvX2dtYShzLCBnbWEpOwo+PiArCQkJCWVs
c2UKPj4gKwkJCQkJcmV0IHw9IGNtZF9hZGRyZXNzX2F1ZGl0KHMsIGdtYSwKPj4gKwkJCQkJCXNp
emVvZih1NjQpLCBpbmRleF9tb2RlKTsKPj4gIAkJCX0KPj4gIAkJfQo+PiAgCX0KPj4gQEAgLTE2
MDcsNyArMTYyMiwxMSBAQCBzdGF0aWMgaW50IGNtZF9oYW5kbGVyX21pX2ZsdXNoX2R3KHN0cnVj
dCBwYXJzZXJfZXhlY19zdGF0ZSAqcykKPj4gIAkJLyogU3RvcmUgRGF0YSBJbmRleCAqLwo+PiAg
CQlpZiAoY21kX3ZhbChzLCAwKSAmICgxIDw8IDIxKSkKPj4gIAkJCWluZGV4X21vZGUgPSB0cnVl
Owo+PiAtCQlyZXQgPSBjbWRfYWRkcmVzc19hdWRpdChzLCBnbWEsIHNpemVvZih1NjQpLCBpbmRl
eF9tb2RlKTsKPj4gKwkJaWYgKGluZGV4X21vZGUpCj4+ICsJCQlyZXQgPSBpbmRleF9tb2RlX3Rv
X2dtYShzLCBnbWEpOwo+PiArCQllbHNlCj4+ICsJCQlyZXQgPSBjbWRfYWRkcmVzc19hdWRpdChz
LCBnbWEsCj4+ICsJCQkJCXNpemVvZih1NjQpLCBpbmRleF9tb2RlKTsKPj4gIAl9Cj4+ICAJLyog
Q2hlY2sgbm90aWZ5IGJpdCAqLwo+PiAgCWlmICgoY21kX3ZhbChzLCAwKSAmICgxIDw8IDgpKSkK
Pj4gLS0gCj4+IDIuMTUuMQo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1ndnQtZGV2

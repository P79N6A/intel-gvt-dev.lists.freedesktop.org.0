Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp2000326ywa;
        Mon, 18 Feb 2019 00:56:59 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZGfb6X/VBXYQsjLMRDXe96IZSkKJ045E+8gFht9lmIrQqy9rZPjPYzmWQ4IcKPhenM8Cpm
X-Received: by 2002:a63:d703:: with SMTP id d3mr18042071pgg.167.1550480219568;
        Mon, 18 Feb 2019 00:56:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550480219; cv=none;
        d=google.com; s=arc-20160816;
        b=Y5SqTVawrpOXapupoAPOr1Yq4kYTRK2HHqwMcaFd0SxPVM79/sekq0GrKb87NnLBa0
         7cuwKR3Q6yQJ6T540XCbpcioRgGh88wvCFP/7QH22HBD5vauBwGRW8f4E0gBcP7g3S4Z
         rIj9QqvCtc0EVATiNl9gtqwmW6VWENOSzfk6kwbwfr/vcViREJkrgNWXSuR+neXdXrZI
         u8BCD2M3qp2oPTwfZWuUGrrMy6OVUU3Ae+snjD9tPNh65tTNrnjF3KvnCzeqv5uOE5I+
         V7XR4GrkBvLAJhOChGYJ7/TNui2qwr7VaO2y4mNDGnM4/r8KZOFjyS5RfsOUI2HiePla
         C0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=Q9Nmhinzs6CzjIT1E105/lYNRxClMtp9BDy8iE4oLuM=;
        b=obkZIn0ZPICKcr7Xfj6V9h6o5LWZW3x7jay+lHkzSOWsrKpBuq1iN5EPek4byAY0Yt
         Ay+tAe5QpjBt8uYvcl+SyHZ93cgVkZbPCcPD00UevP7sjrbdwp8M+7Akm+SO3zlMPa46
         RhWGsIXt8HEF5Z8JS8PUdgVsLMT1rM2AYWWmFRwXiY4RilOrmrkgjDRCi+mFSiJo7YPJ
         kE4C1N9066R/Xy8iC9ZtO304Zjw0amS0ep6nXb3h9NiykseGfKrHR1vVbYmLXsOn2HAa
         Z0DefSfyKHa+rpTAgZygNosR9cw+0oI/orpQlQYa/Exe0YY5ib0wjtGtadkSyMSDtyv7
         JVrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id v8si12836765pgj.21.2019.02.18.00.56.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 00:56:59 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5E289174;
	Mon, 18 Feb 2019 08:56:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3730B89174
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 Feb 2019 08:56:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2019 00:56:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,384,1544515200"; d="scan'208";a="117039124"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga006.jf.intel.com with ESMTP; 18 Feb 2019 00:56:57 -0800
Received: from fmsmsx120.amr.corp.intel.com (10.18.124.208) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 18 Feb 2019 00:56:57 -0800
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 fmsmsx120.amr.corp.intel.com (10.18.124.208) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 18 Feb 2019 00:56:56 -0800
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.110]) by
 SHSMSX104.ccr.corp.intel.com ([169.254.5.102]) with mapi id 14.03.0415.000;
 Mon, 18 Feb 2019 16:56:54 +0800
From: "Zhao, Yakui" <yakui.zhao@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [PATCH 2/2] drm/i915/gvt: Refine the combined
 intel_vgpu_oos_page struct to save memory
Thread-Topic: [PATCH 2/2] drm/i915/gvt: Refine the combined
 intel_vgpu_oos_page struct to save memory
Thread-Index: AQHUxELFqJYIHUk/20W35+GrfseuFqXksJyAgACVJfA=
Date: Mon, 18 Feb 2019 08:56:53 +0000
Message-ID: <01363028D91B0B448414F51B4258CAA574C46A4F@SHSMSX101.ccr.corp.intel.com>
References: <1550135357-30932-1-git-send-email-yakui.zhao@intel.com>
 <1550135357-30932-2-git-send-email-yakui.zhao@intel.com>
 <20190218075741.GP12380@zhen-hp.sh.intel.com>
In-Reply-To: <20190218075741.GP12380@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMmM5NDI5NjUtNDNhYi00MjI1LWFlYjctZjk5N2IyM2Y3NDRkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWHd0WUk1YjBYRkpMT2FTK1QrRVIxUngxdDNJb1I2R05JZEM3VlZ0STFSdWhUMVRrT1ZMMGhSRmU1ZGhLZGNONiJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
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

Cgo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPkZyb206IFpoZW55dSBXYW5nIFttYWlsdG86
emhlbnl1d0BsaW51eC5pbnRlbC5jb21dCj5TZW50OiBNb25kYXksIEZlYnJ1YXJ5IDE4LCAyMDE5
IDM6NTggUE0KPlRvOiBaaGFvLCBZYWt1aSA8eWFrdWkuemhhb0BpbnRlbC5jb20+Cj5DYzogaW50
ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPlN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8y
XSBkcm0vaTkxNS9ndnQ6IFJlZmluZSB0aGUgY29tYmluZWQKPmludGVsX3ZncHVfb29zX3BhZ2Ug
c3RydWN0IHRvIHNhdmUgbWVtb3J5Cj4KPk9uIDIwMTkuMDIuMTQgMTc6MDk6MTcgKzA4MDAsIFpo
YW8gWWFrdWkgd3JvdGU6Cj4+IFRoZSBpbnRlbF92Z3B1X29vc19wYWdlIHVzZXMgdGhlIGNvbWJp
bmVkIHN0cnVjdHVyZSwgd2hpY2ggZW1iZGVkcyB0aGUKPj4gdHJhY2tlZCBwYWdlLiBBcyBpdCBp
cyBhbGxvY2F0ZWQgYnkga21hbGxvYywgdGhlIHNpemUoNDE0MCkgaXMgYWxpZ25lZAo+PiB0byA4
MTkyLiBUaGUgODE5MiBvb3NfcGFnZXMgd2lsbCB3YXN0ZSBhYm91dCAzMk0gbWVtb3J5Lgo+PiBT
byB0aGUgdHJhY2tlZCBwYWdlIGlzIHNwbGl0IGZyb20gdGhlIGludGVsX3ZncHVfb29zX3BhZ2Uu
IEFuZCB0aGlzCj4+IHdpbGwgaGVscCB0byBhc3N1cmUgdGhhdCB0aGUgYWNjZXNzIG9mIHRyYWNr
ZWQgcGFnZSBpcyBjYWNoZSBhbGlnbmVkLgo+Pgo+PiBBbm90aGVyIG1pbm9yIGNoYW5nZSBpcyB0
aGF0IGl0IGRvZXNuJ3QgbmVlZCB0byBiZSBjbGVhcmVkIHRvIHplcm8gYXMKPj4gaXQgaXMgd3Jp
dGVuIGZpcnN0bHkgd2hlbiBvbmUgcGFnZSBpcyBhZGRlZCB0byBvb3NfcGFnZSBsaXN0Lgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBaaGFvIFlha3VpIDx5YWt1aS56aGFvQGludGVsLmNvbT4KPj4gLS0t
Cj4+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgfCA3ICsrKysrKysKPj4gZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5oIHwgMiArLQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9ndHQuYwo+PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyBp
bmRleCBjNzEwM2RkLi45YmExZWQ4IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvZ3R0LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCj4+IEBA
IC0yNDg5LDYgKzI0ODksNyBAQCBzdGF0aWMgdm9pZCBjbGVhbl9zcHRfb29zKHN0cnVjdCBpbnRl
bF9ndnQgKmd2dCkKPj4gIAlsaXN0X2Zvcl9lYWNoX3NhZmUocG9zLCBuLCAmZ3R0LT5vb3NfcGFn
ZV9mcmVlX2xpc3RfaGVhZCkgewo+PiAgCQlvb3NfcGFnZSA9IGNvbnRhaW5lcl9vZihwb3MsIHN0
cnVjdCBpbnRlbF92Z3B1X29vc19wYWdlLAo+bGlzdCk7Cj4+ICAJCWxpc3RfZGVsKCZvb3NfcGFn
ZS0+bGlzdCk7Cj4+ICsJCWZyZWVfcGFnZSgodW5zaWduZWQgbG9uZylvb3NfcGFnZS0+bWVtKTsK
Pj4gIAkJa2ZyZWUob29zX3BhZ2UpOwo+PiAgCX0KPj4gIH0KPj4gQEAgLTI1MDksNiArMjUxMCwx
MiBAQCBzdGF0aWMgaW50IHNldHVwX3NwdF9vb3Moc3RydWN0IGludGVsX2d2dCAqZ3Z0KQo+PiAg
CQkJcmV0ID0gLUVOT01FTTsKPj4gIAkJCWdvdG8gZmFpbDsKPj4gIAkJfQo+PiArCQlvb3NfcGFn
ZS0+bWVtID0gKHZvaWQgKilfX2dldF9mcmVlX3BhZ2VzKEdGUF9LRVJORUwsIDApOwo+PiArCQlp
ZiAoIW9vc19wYWdlLT5tZW0pIHsKPj4gKwkJCXJldCA9IC1FTk9NRU07Cj4+ICsJCQlrZnJlZShv
b3NfcGFnZSk7Cj4+ICsJCQlnb3RvIGZhaWw7Cj4+ICsJCX0KPj4KPj4gIAkJSU5JVF9MSVNUX0hF
QUQoJm9vc19wYWdlLT5saXN0KTsKPj4gIAkJSU5JVF9MSVNUX0hFQUQoJm9vc19wYWdlLT52bV9s
aXN0KTsKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuaAo+PiBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuaCBpbmRleCBkOGNiMDRjLi5lOWY3MmE2IDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmgKPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5oCj4+IEBAIC0yMjEsNyArMjIxLDcgQEAgc3RydWN0
IGludGVsX3ZncHVfb29zX3BhZ2Ugewo+PiAgCXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsKPj4gIAlz
dHJ1Y3QgbGlzdF9oZWFkIHZtX2xpc3Q7Cj4+ICAJaW50IGlkOwo+PiAtCXVuc2lnbmVkIGNoYXIg
bWVtW0k5MTVfR1RUX1BBR0VfU0laRV07Cj4+ICsJdm9pZCAqbWVtOwo+PiAgfTsKPj4KPj4gICNk
ZWZpbmUgR1RUX0VOVFJZX05VTV9JTl9PTkVfUEFHRSA1MTIKPj4gLS0KPgo+TG9va3MgZ29vZCB0
byBtZS4KPgo+UmV2aWV3ZWQtYnk6IFpoZW55dSBXYW5nIDx6aGVueXV3QGxpbnV4LmludGVsLmNv
bT4KPgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgo+YnR3LCBsYXN0IHRpbWUgY2hlY2sgSSB0aGlu
ayB3ZSBjb3VsZCBza2lwIG9vcyBwYWdlIHNldHVwIGlmIG91dCBvZiBzeW5jIGlzIG5vdAo+ZW5h
YmxlZCBhdCBhbGwsIHdvdWxkIHlvdSBhZGQgdGhhdCBjaGFuZ2UgdG9vPwoKTm93IHRoZSBzZXR1
cF9vb3NfcGFnZSBpcyBjb250cm9sbGVkIGJ5IHRoZSAiZW5hYmxlX291dF9vZl9zeW5jIi4gV2hl
biB0aGUgIm91dF9vZl9zeW5jIiBpcyBub3QgZGlzYWJsZWQsIGl0IHdpbGwgc2tpcCB0aGUgb29z
X3BhZ2UuClNvIGl0IGRvZXNuJ3QgbmVlZCB0byBjaGFuZ2UgaXQuCgoKCj4KPnRoYW5rcwo+Cj4t
LQo+T3BlbiBTb3VyY2UgVGVjaG5vbG9neSBDZW50ZXIsIEludGVsIGx0ZC4KPgo+JGdwZyAtLWtl
eXNlcnZlciB3d3drZXlzLnBncC5uZXQgLS1yZWN2LWtleXMgNEQ3ODE4MjcKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5n
IGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

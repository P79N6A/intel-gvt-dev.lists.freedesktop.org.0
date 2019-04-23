Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3329091ywo;
        Tue, 23 Apr 2019 04:39:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwL5wDD6RwG5wfa/i1+7B/DE3bNN5XRPcTlgBDQMw7nJ1/vFV+U1QIM/9Y+Tsse9NqAJNh1
X-Received: by 2002:a65:44c6:: with SMTP id g6mr23767864pgs.157.1556019565667;
        Tue, 23 Apr 2019 04:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556019565; cv=none;
        d=google.com; s=arc-20160816;
        b=pHFMKa8x6eCtuNCRPCNR8S2+Ab6p8XZp4JWznzg/EMKMapSbASeXdYoHi3IjBdyKwf
         HmMrO+M6p1xf/ZGqBMIIh8b8jJChygT+VfsugZqiQhIsehd6Wg/QEQaS6t0+f4T/WTs/
         uDcZ6Wa66C8eFJp1ntAdZZd8XLvuaQ0RB41X9zD63+5UcjGjUXEoeU766nfcVR3zNeuw
         4GJ6/A2BC8fG06qHBmHNC/XzwW2kBhJC+K6LZCSCvwY1ZGnOJAbA6z5IntMQBBcZhj9H
         KJtyR6JxmvzzgGrrjsT8pYA0XpwEzOThQzxzN8bG/2Ro+64kBr+9m4c2/+Q1diijnfld
         B7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:organization:references:in-reply-to
         :message-id:subject:to:from:date:delivered-to;
        bh=sLQLy8MuGkP96jrPBmwcJR4lCk2/86u1rhV+d2Iz5iA=;
        b=wBmSbt2qbFbUgJbMl/yFcrtfNs4ZkAP5xH4Lpv1LX0cln69T45PSEsRglfZQESu0PP
         A6GDjFTG89mGNn+f92VjSjIyyG7r+TkTWNQirVBLWghIx3S+ZhV14ZnleCl068Va+aBU
         M6byuXWGqJRdNl09OfuVM9Ct2L1rS6tlzHzm19Yb15oj2qdOeofNQRMDSG+Dx4gh7us3
         UNUZOVnMUeNfNRZMoZYfMo8NbZjWmncSrMaeKYvjvttcQgAFioIcQS+2vVauFeKGq2B3
         cqpVzUnqj1ZiZ5EZ9ZgY3dA3f+x2CBOkX3fuQt67QWbtePJAOR4StJQBSjVmmDbq6kRW
         etxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id f64si15939945plf.258.2019.04.23.04.39.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2019 04:39:25 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF986891D2;
	Tue, 23 Apr 2019 11:39:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CEC891D2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Apr 2019 11:39:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 87AFE88309;
 Tue, 23 Apr 2019 11:39:23 +0000 (UTC)
Received: from gondolin (dhcp-192-187.str.redhat.com [10.33.192.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A74C5646A8;
 Tue, 23 Apr 2019 11:39:13 +0000 (UTC)
Date: Tue, 23 Apr 2019 13:39:11 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/gvt: export mdev device version to sysfs
 for Intel vGPU
Message-ID: <20190423133911.5ee7bf38.cohuck@redhat.com>
In-Reply-To: <20190419083559.19725-1-yan.y.zhao@intel.com>
References: <20190419083258.19580-1-yan.y.zhao@intel.com>
 <20190419083559.19725-1-yan.y.zhao@intel.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Tue, 23 Apr 2019 11:39:23 +0000 (UTC)
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
Cc: cjia@nvidia.com, kvm@vger.kernel.org, aik@ozlabs.ru,
 Zhengxiao.zx@alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, kwankhede@nvidia.com, eauger@redhat.com,
 yi.l.liu@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, libvir-list@redhat.com,
 arei.gonglei@huawei.com, felipe@nutanix.com, Ken.Xue@amd.com,
 kevin.tian@intel.com, dgilbert@redhat.com, zhenyuw@linux.intel.com,
 alex.williamson@redhat.com, intel-gvt-dev@lists.freedesktop.org,
 changpeng.liu@intel.com, linux-kernel@vger.kernel.org, zhi.a.wang@intel.com,
 jonathan.davies@nutanix.com, shaopeng.he@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCAxOSBBcHIgMjAxOSAwNDozNTo1OSAtMDQwMApZYW4gWmhhbyA8eWFuLnkuemhhb0Bp
bnRlbC5jb20+IHdyb3RlOgoKPiBUaGlzIGZlYXR1cmUgaW1wbGVtZW50cyB0aGUgdmVyc2lvbiBh
dHRyaWJ1dGUgZm9yIEludGVsJ3MgdkdQVSBtZGV2Cj4gZGV2aWNlcy4KPiAKPiB2ZXJzaW9uIGF0
dHJpYnV0ZSBpcyBydy4gSXQgaXMgcXVlcmllZCBieSB1c2Vyc3BhY2Ugc29mdHdhcmUgbGlrZSBs
aWJ2aXJ0Cj4gdG8gY2hlY2sgd2hldGhlciB0d28gdkdQVXMgYXJlIGNvbXBhdGlibGUgZm9yIGxp
dmUgbWlncmF0aW9uLgo+IAo+IEl0IGNvbnNpc3RzIG9mIHR3byBwYXJ0czogY29tbW9uIHBhcnQg
YW5kIHZlbmRvciBwcm9wcmlldGFyeSBwYXJ0Lgo+IGNvbW1vbiBwYXJ0OiAzMiBiaXQuIGxvd2Vy
IDE2IGJpdHMgaXMgdmVuZG9yIGlkIGFuZCBoaWdoZXIgMTYgYml0cwo+ICAgICAgICAgICAgICBp
ZGVudGlmaWVzIGRldmljZSB0eXBlLiBlLmcuLCBmb3IgcGNpIGRldmljZSwgaXQgaXMKPiAgICAg
ICAgICAgICAgInBjaSB2ZW5kb3IgaWQiIHwgKFZGSU9fREVWSUNFX0ZMQUdTX1BDSSA8PCAxNiku
Cj4gdmVuZG9yIHByb3ByaWV0YXJ5IHBhcnQ6IHRoaXMgcGFydCBpcyB2YXJpZWQgaW4gbGVuZ3Ro
LiB2ZW5kb3IgZHJpdmVyIGNhbgo+ICAgICAgICAgICAgICBzcGVjaWZ5IGFueSBzdHJpbmcgdG8g
aWRlbnRpZnkgYSBkZXZpY2UuCj4gCj4gRm9yIEludGVsIHZHUFUgb2YgZ2VuOCBhbmQgZ2VuOSwg
dGhlIHZlbmRvciBwcm9wcmlldGFyeSBwYXJ0IGN1cnJlbnRseQo+IGNvbnNpc3RzIG9mIDIgZmll
bGRzOiAiZGV2aWNlIGlkIiArICJtZGV2IHR5cGUiLgo+IAo+IFJlYWRpbmcgZnJvbSBhIHZHUFUn
cyB2ZXJzaW9uIGF0dHJpYnV0ZSwgYSBzdHJpbmcgaXMgcmV0dXJuZWQgaW4gYmVsb3cKPiBmb3Jt
YXQ6IDAwMDI4MDg2LTxkZXZpY2UgaWQ+LTxtZGV2IHR5cGU+LiBlLmcuCj4gMDAwMjgwODYtMTkz
Yi1pOTE1LUdWVGdfVjVfMi4KPiAKPiBXcml0aW5nIGEgc3RyaW5nIHRvIGEgdkdQVSdzIHZlcnNp
b24gYXR0cmlidXRlIHdpbGwgdHJpZ2dlciBHVlQgdG8gY2hlY2sKPiB3aGV0aGVyIGEgdkdQVSBp
ZGVudGlmaWVkIGJ5IHRoZSB3cml0dGVuIHN0cmluZyBpcyBjb21wYXRpYmxlIHdpdGgKPiBjdXJy
ZW50IHZHUFUgb3duaW5nIHRoaXMgdmVyc2lvbiBhdHRyaWJ1dGUuIGVycm5vIGlzIHJldHVybmVk
IGlmIHRoZSB0d28KPiB2R1BVcyBhcmUgaW5jb21wYXRpYmxlLiBUaGUgbGVuZ3RoIG9mIHdyaXR0
ZW4gc3RyaW5nIGlzIHJldHVybmVkIGluCj4gY29tcGF0aWJsZSBjYXNlLgo+IAo+IEZvciBvdGhl
ciBwbGF0Zm9ybXMsIGFuZCBmb3IgR1ZUIG5vdCBzdXBwb3J0aW5nIHZHUFUgbGl2ZSBtaWdyYXRp
b24KPiBmZWF0dXJlLCBlcnJub3MgYXJlIHJldHVybmVkIHdoZW4gcmVhZC93cml0ZSBvZiBtZGV2
IGRldmljZXMnIHZlcnNpb24KPiBhdHRyaWJ1dGVzLgo+IAo+IEZvciBvbGQgR1ZUIHZlcnNpb25z
IHdoZXJlIG5vIHZlcnNpb24gYXR0cmlidXRlcyBleHBvc2VkIGluIHN5c2ZzLCBpdCBpcwo+IHJl
Z2FyZGVkIGFzIG5vdCBzdXBwb3J0aW5nIHZHUFUgbGl2ZSBtaWdyYXRpb24uCj4gCj4gRm9yIGZ1
dHVyZSBwbGF0Zm9ybXMsIGJlc2lkZXMgdGhlIGN1cnJlbnQgMiBmaWVsZHMgaW4gdmVuZG9yIHBy
b3ByaWV0YXJ5Cj4gcGFydCwgbW9yZSBmaWVsZHMgbWF5IGJlIGFkZGVkIHRvIGlkZW50aWZ5IElu
dGVsIHZHUFUgd2VsbCBmb3IgbGl2ZQo+IG1pZ3JhdGlvbiBwdXJwb3NlLgo+IAo+IENjOiBBbGV4
IFdpbGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPgo+IENjOiBFcmlrIFNrdWx0
ZXR5IDxlc2t1bHRldEByZWRoYXQuY29tPgo+IENjOiAiRHIuIERhdmlkIEFsYW4gR2lsYmVydCIg
PGRnaWxiZXJ0QHJlZGhhdC5jb20+Cj4gQ2M6IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQu
Y29tPgo+IENjOiAiVGlhbiwgS2V2aW4iIDxrZXZpbi50aWFuQGludGVsLmNvbT4KPiBDYzogWmhl
bnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPgo+IENjOiAiV2FuZywgWmhpIEEiIDx6
aGkuYS53YW5nQGludGVsLmNvbT4KPiBjOiBOZW8gSmlhIDxjamlhQG52aWRpYS5jb20+Cj4gQ2M6
IEtpcnRpIFdhbmtoZWRlIDxrd2Fua2hlZGVAbnZpZGlhLmNvbT4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9NYWtlZmlsZSAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2RldmljZV92ZXJzaW9uLmMgfCA5NCArKysrKysrKysrKysrKysrKysrKysrKwo+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmMgICAgICAgICAgICB8IDU1ICsrKysrKysrKysr
KysKPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oICAgICAgICAgICAgfCAgNiArKwo+
ICA0IGZpbGVzIGNoYW5nZWQsIDE1NiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGV2aWNlX3ZlcnNpb24u
Ywo+IAoKKC4uLikKCj4gK3N0YXRpYyBib29sIGlzX2NvbXBhdGlibGUoY29uc3QgY2hhciAqc2Vs
ZiwgY29uc3QgY2hhciAqcmVtb3RlKQo+ICt7Cj4gKwlpZiAoc3RybGVuKHJlbW90ZSkgIT0gc3Ry
bGVuKHNlbGYpKQo+ICsJCXJldHVybiBmYWxzZTsKPiArCj4gKwlyZXR1cm4gKHN0cm5jbXAoc2Vs
ZiwgcmVtb3RlLCBzdHJsZW4oc2VsZikpKSA/IGZhbHNlIDogdHJ1ZTsKPiArfQo+ICsKPiArc3Np
emVfdCBpbnRlbF9ndnRfZ2V0X3ZmaW9fZGV2aWNlX3ZlcnNpb25fbGVuKHN0cnVjdCBkcm1faTkx
NV9wcml2YXRlICpkZXZfcHJpdikKPiArewo+ICsJaWYgKCFJU19HRU4oZGV2X3ByaXYsIDgpICYm
ICFJU19HRU4oZGV2X3ByaXYsIDkpKQo+ICsJCXJldHVybiAtRU5PREVWOwo+ICsKPiArCXJldHVy
biBQQUdFX1NJWkU7Cj4gK30KPiArCj4gK3NzaXplX3QgaW50ZWxfZ3Z0X2dldF92ZmlvX2Rldmlj
ZV92ZXJzaW9uKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiwKPiArCQljaGFyICpi
dWYsIGNvbnN0IGNoYXIgKm1kZXZfdHlwZSkKPiArewo+ICsJaW50IGNudCA9IDAsIHJldCA9IDA7
Cj4gKwljb25zdCBjaGFyICpzdHIgPSBOVUxMOwo+ICsKPiArCS8qIGN1cnJlbnRseSBvbmx5IGdl
bjggJiBnZW45IGFyZSBzdXBwb3J0ZWQgKi8KPiArCWlmICghSVNfR0VOKGRldl9wcml2LCA4KSAm
JiAhSVNfR0VOKGRldl9wcml2LCA5KSkKPiArCQlyZXR1cm4gLUVOT0RFVjsKPiArCj4gKwkvKiBm
aXJzdCAzMiBiaXQgY29tbW9uIHBhcnQgc3BlY2lmeWluZyB2ZW5kb3IgaWQgYW5kIGl0J3MgYSBw
Y2kKPiArCSAqIGRldmljZQo+ICsJICovCj4gKwljbnQgPSBzbnByaW50ZihidWYsIEdWVF9ERVZJ
Q0VfVkVSU0lPTl9DT01NT05fTEVOICsgMSwKPiArCQkJIiUwOHgiLCBHVlRfVkZJT19ERVZJQ0Vf
VkVORE9SX0lEKTsKPiArCWJ1ZiArPSBjbnQ7Cj4gKwlyZXQgKz0gY250Owo+ICsKPiArCS8qIHZl
bmRvciBwcm9wcmlldGFyeSBwYXJ0OiBkZXZpY2UgaWQgKyBtZGV2IHR5cGUgKi8KPiArCS8qIGRl
dmljZSBpZCAqLwo+ICsJY250ID0gc25wcmludGYoYnVmLCBHVlRfREVWSUNFX1ZFUlNJT05fREVW
SUNFX0lEX0xFTiArIDIsCj4gKwkJCSItJTA0eCIsIElOVEVMX0RFVklEKGRldl9wcml2KSk7Cj4g
KwlidWYgKz0gY250Owo+ICsJcmV0ICs9IGNudDsKPiArCj4gKwkvKiBtZGV2IHR5cGUgKi8KPiAr
CXN0ciA9IG1kZXZfdHlwZTsKPiArCWNudCA9IHNucHJpbnRmKGJ1Ziwgc3RybGVuKHN0cikgKyAz
LCAiLSVzXG4iLCBtZGV2X3R5cGUpOwo+ICsJYnVmICs9IGNudDsKPiArCXJldCArPSBjbnQ7Cj4g
Kwo+ICsJcmV0dXJuIHJldDsKPiArfQoKTG9va2luZyBhdCB0aGlzIGhhbmRsaW5nLCBpdCBzZWVt
cyBtdWNoIGVhc2llciB0byBtZSB0byBzaW1wbHkgdXNlIGEKbnVtZXJpYyB2YWx1ZSBpbnN0ZWFk
IG9mIGEgc3RyaW5nOiBZb3UgZG9uJ3QgaGF2ZSB0byBidWlsZCBpdCB2aWEKc3ByaW50ZiwgdGhl
cmUgYXJlIGdlbmVyaWMgZnVuY3Rpb25zIGZvciBwYXJzaW5nIGEgc3RyaW5nIGlucHV0IGludG8g
YQpzaW1wbGUgbnVtYmVyLCBhbmQgeW91IGhhdmUgbW9yZSBvcHRpb25zIGZvciBjb21wYXRpYmls
aXR5IChlLmcuCiJ2ZXJzaW9uIG11c3QgYmUgYmV0d2VlbiBtIGFuZCBuIiBpbnN0ZWFkIG9mIGFu
IGV4YWN0IG1hdGNoKS4KCklmIHlvdSBzdGlsbCBuZWVkIHRvIGVuY29kZSB0aGUgZGV2aWNlIGlk
IGhlcmUsIHlvdSBzaG91bGQgYmUgYWJsZSB0bwplYXNpbHkgZG8gc29tZXRoaW5nIGxpa2UgKGRl
dmljZV9pZCA8PCAxNikgfCBtaWdyYXRpb25fdmVyc2lvbiAtLSBkbwp5b3UgdGhpbmsgdGhhdCBj
b3VsZCB3b3JrPwoKPiArCj4gK3NzaXplX3QgaW50ZWxfZ3Z0X2NoZWNrX3ZmaW9fZGV2aWNlX3Zl
cnNpb24oc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2LAo+ICsJCWNvbnN0IGNoYXIg
KnNlbGYsIGNvbnN0IGNoYXIgKnJlbW90ZSkKPiArewo+ICsKPiArCS8qIGN1cnJlbnRseSBvbmx5
IGdlbjggJiBnZW45IGFyZSBzdXBwb3J0ZWQgKi8KPiArCWlmICghSVNfR0VOKGRldl9wcml2LCA4
KSAmJiAhSVNfR0VOKGRldl9wcml2LCA5KSkKPiArCQlyZXR1cm4gLUVOT0RFVjsKPiArCj4gKwlp
ZiAoIWlzX2NvbXBhdGlibGUoc2VsZiwgcmVtb3RlKSkKPiArCQlyZXR1cm4gLUVJTlZBTDsKCkkg
dGhpbmsgdGhlIG1lYW5pbmcgb2YgdGhlIGVycm9yIGNvZGVzIHNob3VsZCByZWFsbHkgYmUgc3Rh
bmRhcmRpemVkCmFjcm9zcyB2ZW5kb3IgZHJpdmVycywgaWYgd2UgbmVlZCBhIHZhbHVlIGZvciAi
dGhpcyBkZXZpY2UgZG9lcyBub3QKc3VwcG9ydCBtaWdyYXRpb24gYXQgYWxsIi4gKFlvdXIgY2hv
aWNlcyBsb29rIHJlYXNvbmFibGUgZm9yIHRoYXQuKQoKPiArCj4gKwlyZXR1cm4gMDsKPiArfQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmMgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvZ3Z0LmMKPiBpbmRleCA0M2Y0MjQyMDYyZGQuLmU3MjA0NjViOTNkOCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmMKPiBAQCAtMTA1LDE0ICsxMDUsNjkgQEAgc3RhdGlj
IHNzaXplX3QgZGVzY3JpcHRpb25fc2hvdyhzdHJ1Y3Qga29iamVjdCAqa29iaiwgc3RydWN0IGRl
dmljZSAqZGV2LAo+ICAJCSAgICAgICB0eXBlLT53ZWlnaHQpOwo+ICB9Cj4gIAo+ICtzdGF0aWMg
c3NpemVfdCB2ZXJzaW9uX3Nob3coc3RydWN0IGtvYmplY3QgKmtvYmosIHN0cnVjdCBkZXZpY2Ug
KmRldiwKPiArCQljaGFyICpidWYpCj4gK3sKPiArI2lmZGVmIEdWVF9NSUdSQVRJT05fVkVSU0lP
Tgo+ICsJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPSBrZGV2X3RvX2k5MTUoZGV2KTsK
PiArCWNvbnN0IGNoYXIgKm1kZXZfdHlwZSA9IGtvYmplY3RfbmFtZShrb2JqKTsKPiArCj4gKwly
ZXR1cm4gaW50ZWxfZ3Z0X2dldF92ZmlvX2RldmljZV92ZXJzaW9uKGk5MTUsIGJ1ZiwgbWRldl90
eXBlKTsKPiArI2Vsc2UKPiArCS8qIGRvIG5vdCBzdXBwb3J0IGxpdmUgbWlncmF0aW9uICovCj4g
KwlyZXR1cm4gLUVJTlZBTDsKCi4uLmJ1dCB0aGlzIGxvb2tzIGluY29uc2lzdGVudC4gSSB3b3Vs
ZCBleHBlY3QgLUVOT0RFViBoZXJlLCBzYW1lIGFzCmZvciBub24tZ2VuezgsOX0uCgpPciBzaW1w
bHkgZG8gbm90IGNyZWF0ZSB0aGUgYXR0cmlidXRlIGF0IGFsbCBpbiB0aGF0IGNhc2U/Cgo+ICsj
ZW5kaWYKPiArfQo+ICsKPiArc3RhdGljIHNzaXplX3QgdmVyc2lvbl9zdG9yZShzdHJ1Y3Qga29i
amVjdCAqa29iaiwgc3RydWN0IGRldmljZSAqZGV2LAo+ICsJCWNvbnN0IGNoYXIgKmJ1Ziwgc2l6
ZV90IGNvdW50KQo+ICt7Cj4gKyNpZmRlZiBHVlRfTUlHUkFUSU9OX1ZFUlNJT04KPiArCWNoYXIg
KnJlbW90ZSA9IE5VTEwsICpzZWxmID0gTlVMTDsKPiArCWludCBsZW4sIHJldCA9IDA7Cj4gKwlz
dHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IGtkZXZfdG9faTkxNShkZXYpOwo+ICsJY29u
c3QgY2hhciAqbWRldl90eXBlID0ga29iamVjdF9uYW1lKGtvYmopOwo+ICsKPiArCWxlbiA9IGlu
dGVsX2d2dF9nZXRfdmZpb19kZXZpY2VfdmVyc2lvbl9sZW4oaTkxNSk7Cj4gKwlpZiAobGVuIDwg
MCkKPiArCQlyZXR1cm4gbGVuOwo+ICsKPiArCXNlbGYgPSBrbWFsbG9jKGxlbiwgR0ZQX0tFUk5F
TCk7Cj4gKwlpZiAoIXNlbGYpCj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICsJcmV0ID0gaW50
ZWxfZ3Z0X2dldF92ZmlvX2RldmljZV92ZXJzaW9uKGk5MTUsIHNlbGYsIG1kZXZfdHlwZSk7Cj4g
KwlpZiAocmV0IDwgMCkKPiArCQlnb3RvIG91dDsKPiArCj4gKwlyZW1vdGUgPSBrc3RybmR1cChi
dWYsIGNvdW50LCBHRlBfS0VSTkVMKTsKPiArCWlmICghcmVtb3RlKSB7Cj4gKwkJcmV0ID0gLUVO
T01FTTsKPiArCQlnb3RvIG91dDsKPiArCX0KPiArCj4gKwlyZXQgPSBpbnRlbF9ndnRfY2hlY2tf
dmZpb19kZXZpY2VfdmVyc2lvbihpOTE1LCBzZWxmLCByZW1vdGUpOwo+ICsKPiArb3V0Ogo+ICsJ
a2ZyZWUoc2VsZik7Cj4gKwlrZnJlZShyZW1vdGUpOwo+ICsJcmV0dXJuIChyZXQgPCAwID8gcmV0
IDogY291bnQpOwo+ICsjZWxzZQo+ICsJLyogZG8gbm90IHN1cHBvcnQgbGl2ZSBtaWdyYXRpb24g
Ki8KPiArCXJldHVybiAtRUlOVkFMOwo+ICsjZW5kaWYKPiArfQo+ICsKPiAgc3RhdGljIE1ERVZf
VFlQRV9BVFRSX1JPKGF2YWlsYWJsZV9pbnN0YW5jZXMpOwo+ICBzdGF0aWMgTURFVl9UWVBFX0FU
VFJfUk8oZGV2aWNlX2FwaSk7Cj4gIHN0YXRpYyBNREVWX1RZUEVfQVRUUl9STyhkZXNjcmlwdGlv
bik7Cj4gK3N0YXRpYyBNREVWX1RZUEVfQVRUUl9SVyh2ZXJzaW9uKTsKPiAgCj4gIHN0YXRpYyBz
dHJ1Y3QgYXR0cmlidXRlICpndnRfdHlwZV9hdHRyc1tdID0gewo+ICAJJm1kZXZfdHlwZV9hdHRy
X2F2YWlsYWJsZV9pbnN0YW5jZXMuYXR0ciwKPiAgCSZtZGV2X3R5cGVfYXR0cl9kZXZpY2VfYXBp
LmF0dHIsCj4gIAkmbWRldl90eXBlX2F0dHJfZGVzY3JpcHRpb24uYXR0ciwKPiArCSZtZGV2X3R5
cGVfYXR0cl92ZXJzaW9uLmF0dHIsCj4gIAlOVUxMLAo+ICB9Owo+ICAKKC4uLikKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWls
aW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

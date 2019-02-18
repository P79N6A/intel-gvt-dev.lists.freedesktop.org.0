Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp2001048ywa;
        Mon, 18 Feb 2019 00:58:09 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaAlahZ5ZP3dk25LMBxc7kHRylzsMAihsRRhGbZujyjPHCQSR6hY75ODKpSB4JYyIW+1gj4
X-Received: by 2002:a62:4d81:: with SMTP id a123mr23698671pfb.122.1550480289399;
        Mon, 18 Feb 2019 00:58:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550480289; cv=none;
        d=google.com; s=arc-20160816;
        b=cYbO49Lm82su51oU8X5T8ECnOzqaM1ZAjwenMyxipRMpQUMwfQdTFn7+M3jY2Inxcz
         aXtS7nPFEZKC6rcq9hPLJH9zBWUMfEKk8eaeAHG9m515bNeOvrEmB8i1RYMs4KhZwwym
         R7VXjhfftSDRtJz4S73nOMauCKECWWVNmhHuQCLJ0bnRP4Ndi19gr/QLTsIptZSdbHfE
         qb6hBXKJjoyMPAa9TjWROghrbwjToLBWfxv4ePc0ndJIYaRSTkAxAGdnCJQPX7a/Bx1m
         gMFEfFQz5kKOQUc8baoTHaBAHg0QeWNyUbe45EH1aZQh0eCX2/ydn8TIaoa4yMgT9AGg
         vIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=7/NFgvkORqnKTJw4v8rASZDgN/vrJXW3F84PPSESB3c=;
        b=fo49gn6nfcb+U4LWJq9EUJpcTcq3KzU8Xk4/dqUFcWtIGuyt5pFXgHw4P8QGtCac3Z
         L3WpcqfDB1SqzSG9cKVYNH4gykcj+xhyWackWxjS1n/BVSg6rjXDeZuBlUDaU/kTkkdU
         SzdnDMvzd5Kh5DAy0hvrkMXtL1v8onhZACUdLv52E2h7zxBiub5ghyoIXZ/EtfJLrBp5
         zkPi21avtLgmmLWgGjfd8XtTaoHZx7vVMLm6BcTR8Ir1aIvLJnbK2z8K+yZIfvOhmcur
         +MV4bLsEEiLprYLcIjiKNlFiuggzyQFqVeufIo824eobj3P+6e9Vzx1fqRhLaJQLRxT6
         FaJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id p1si13213716plk.260.2019.02.18.00.58.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 00:58:09 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC48189123;
	Mon, 18 Feb 2019 08:58:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8A489123
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 Feb 2019 08:58:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2019 00:58:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,384,1544515200"; d="scan'208";a="117039310"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga006.jf.intel.com with ESMTP; 18 Feb 2019 00:58:06 -0800
Received: from fmsmsx161.amr.corp.intel.com (10.18.125.9) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 18 Feb 2019 00:58:06 -0800
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 FMSMSX161.amr.corp.intel.com (10.18.125.9) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 18 Feb 2019 00:58:05 -0800
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.110]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.232]) with mapi id 14.03.0415.000;
 Mon, 18 Feb 2019 16:58:03 +0800
From: "Zhao, Yakui" <yakui.zhao@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: RE: [PATCH 1/2] drm/i915/gvt: Refine the snapshort range of I915
 MCHBAR to optimize gvt-g boot time
Thread-Topic: [PATCH 1/2] drm/i915/gvt: Refine the snapshort range of I915
 MCHBAR to optimize gvt-g boot time
Thread-Index: AQHUxELA+kXx1g3Nmk6JsJy+BCknDaXkr5aAgACXyiA=
Date: Mon, 18 Feb 2019 08:58:03 +0000
Message-ID: <01363028D91B0B448414F51B4258CAA574C46A75@SHSMSX101.ccr.corp.intel.com>
References: <1550135357-30932-1-git-send-email-yakui.zhao@intel.com>
 <20190218075401.GO12380@zhen-hp.sh.intel.com>
In-Reply-To: <20190218075401.GO12380@zhen-hp.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjVhNGU4Y2EtNDBmNS00OGZmLWI1ZDQtYmJjNWJkM2RkZDY1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUjBXTnYxK0haYnZMVWVtMk9YcTROSGJ1a1RPa01jcmxCTGxISEE5Uk9GSG5ablFRZldEVlBJTzQ5cnNaamtBayJ9
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

Cgo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPkZyb206IGludGVsLWd2dC1kZXYgW21haWx0
bzppbnRlbC1ndnQtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbgo+QmVoYWxm
IE9mIFpoZW55dSBXYW5nCj5TZW50OiBNb25kYXksIEZlYnJ1YXJ5IDE4LCAyMDE5IDM6NTQgUE0K
PlRvOiBaaGFvLCBZYWt1aSA8eWFrdWkuemhhb0BpbnRlbC5jb20+Cj5DYzogaW50ZWwtZ3Z0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPlN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8yXSBkcm0vaTkx
NS9ndnQ6IFJlZmluZSB0aGUgc25hcHNob3J0IHJhbmdlIG9mIEk5MTUKPk1DSEJBUiB0byBvcHRp
bWl6ZSBndnQtZyBib290IHRpbWUKPgo+T24gMjAxOS4wMi4xNCAxNzowOToxNiArMDgwMCwgWmhh
byBZYWt1aSB3cm90ZToKPj4gQ3VycmVudGx5IGl0IHdpbGwgdGFrZSB0aGUgc25hcHNob3Qgb2Yg
dGhlIE1DSEJBUiByZWdpc3RlcnMgZm9yIGd2dC1nCj4+IGluaXRpYWxpemF0aW9uIHNvIHRoYXQg
aXQgY2FuIGJlIHVzZWQgZm9yIGd1ZXN0IHZncHUuIEFuZCBpdCB3aWxsCj4+IGNvdmVyIGZyb20g
MHgxNDAwMDAgdG8gMHgxN2ZmZmYuIEluIGZhY3QgYmFzZWQgb24gdGhlIEhXIHNwZWMgbW9zdCBv
Zgo+PiB0aGVtIGFyZSBtZWFubGluZ2xlc3MgYW5kIHNvbWUgdGltZSBpcyB3YXN0ZWQgdG8gcmVh
ZCB0aGVzZSByZWdpc3Rlci4KPj4gT25seSB0aGUgcmFuZ2Ugb2YgMHgxNDQwMDAgdG8gMHgxNDdm
ZmYgY29udGFpbnMgdGhlIHZhbGlkIGRlZmluaXRpb24uCj4+IFNvIHRoZSByYW5nZSBvZiBjYXB0
dXJpbmcgSTkxNSBNQ0hCQVIgcmVnaXN0ZXIgaXMgcmVmaW5lZCwgd2hpY2ggaGVscHMKPj4gdG8g
b3B0aW1pemUgdGhlIGd2dC1nIGJvb3QgdGltZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWmhhbyBZ
YWt1aSA8eWFrdWkuemhhb0BpbnRlbC5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2hhbmRsZXJzLmMgfCA0ICsrKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9oYW5kbGVycy5jCj4+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJz
LmMKPj4gaW5kZXggYmM2NGI4MS4uMDg3NzY3OCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2hhbmRsZXJzLmMKPj4gQEAgLTQ3LDYgKzQ3LDggQEAKPj4gICNkZWZpbmUgUENIX1BQX09GRl9E
RUxBWVMgX01NSU8oMHhjNzIwYykgICNkZWZpbmUgUENIX1BQX0RJVklTT1IKPj4gX01NSU8oMHhj
NzIxMCkKPj4KPj4gKyNkZWZpbmUgTUNIQkFSX01FTV9CQVNFCj4JX01NSU8oTUNIQkFSX01JUlJP
Ul9CQVNFX1NOQiArIDB4NDAwMCkKPj4gKwo+Cj5QbHMgbW92ZSB0aGlzIHRvIHJlZy5oIHdoaWNo
IHdlIGluY2x1ZGUgYWxsIEdWVCBzcGVjaWZpYyBkZWZpbmUgKHllYWgsIEkga25vdwo+dGhvc2Ug
UENIIGRlZmluZSBsb29rcyBvZGQsIG5lZWQgdG8gY2xlYW4gaXQgdXAgYW55d2F5KS4KClRoYW5r
cyBmb3IgdGhlIHJldmlldy4KT0suIEl0IHdpbGwgYmUgbW92ZWQgdG8gcmVnLmggaW4gbmV4dCB2
ZXJzaW9uLgoKPgo+PiAgdW5zaWduZWQgbG9uZyBpbnRlbF9ndnRfZ2V0X2RldmljZV90eXBlKHN0
cnVjdCBpbnRlbF9ndnQgKmd2dCkgIHsKPj4gIAlpZiAoSVNfQlJPQURXRUxMKGd2dC0+ZGV2X3By
aXYpKQo+PiBAQCAtMzI2NSw3ICszMjY3LDcgQEAgdm9pZCBpbnRlbF9ndnRfY2xlYW5fbW1pb19p
bmZvKHN0cnVjdCBpbnRlbF9ndnQKPj4gKmd2dCkKPj4gIC8qIFNwZWNpYWwgTU1JTyBibG9ja3Mu
ICovCj4+ICBzdGF0aWMgc3RydWN0IGd2dF9tbWlvX2Jsb2NrIG1taW9fYmxvY2tzW10gPSB7Cj4+
ICAJe0RfU0tMX1BMVVMsIF9NTUlPKENTUl9NTUlPX1NUQVJUX1JBTkdFKSwgMHgzMDAwLCBOVUxM
LAo+TlVMTH0sCj4+IC0Je0RfQUxMLCBfTU1JTyhNQ0hCQVJfTUlSUk9SX0JBU0VfU05CKSwgMHg0
MDAwMCwgTlVMTCwgTlVMTH0sCj4+ICsJe0RfQUxMLCBNQ0hCQVJfTUVNX0JBU0UsIDB4NDAwMCwg
TlVMTCwgTlVMTH0sCj4+ICAJe0RfQUxMLCBfTU1JTyhWR1RfUFZJTkZPX1BBR0UpLCBWR1RfUFZJ
TkZPX1NJWkUsCj4+ICAJCXB2aW5mb19tbWlvX3JlYWQsIHB2aW5mb19tbWlvX3dyaXRlfSwKPj4g
IAl7RF9BTEwsIExHQ19QQUxFVFRFKFBJUEVfQSwgMCksIDEwMjQsIE5VTEwsIE5VTEx9LAo+PiAt
LQo+Cj5JIHRoaW5rIHRoYXQncyBmaW5lLCBhcyBmb3IgcmVjZW50IEhXIGd1ZXN0IGRyaXZlcnMg
c2hvdWxkbid0IGRlcGVuZCBvbgo+YW55dGhpbmcgaW4gaGVhZCByYW5nZSBvZiBNQ0hCQVIuCj4K
PkFja2VkLWJ5OiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+Cj4KPi0tCj5P
cGVuIFNvdXJjZSBUZWNobm9sb2d5IENlbnRlciwgSW50ZWwgbHRkLgo+Cj4kZ3BnIC0ta2V5c2Vy
dmVyIHd3d2tleXMucGdwLm5ldCAtLXJlY3Yta2V5cyA0RDc4MTgyNwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlz
dAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=

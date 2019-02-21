Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp5106579ywa;
        Wed, 20 Feb 2019 19:16:52 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaQznkXOMSvWi+u0MHRHCWGJspDb60tfiCMCGJHO5IbVinlNLzu+rW9T3gljVOFPQcEAaui
X-Received: by 2002:a63:2808:: with SMTP id o8mr25319135pgo.188.1550719012783;
        Wed, 20 Feb 2019 19:16:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550719012; cv=none;
        d=google.com; s=arc-20160816;
        b=frA+lJDCfgBZFCSHE7wquc28D54GFiHwSWip1AgL5u1absOoirpM2H8csovvep9cVf
         fV2T5B7VO7AVKhBobfQBdcuhNDE/4mpOBAUVzWxXXH6Cp/vEBhP0+MOdq4fVIX9zXcNb
         Ky32soX77oTQN7xaGw6pAk3UfZONGhJcaRUPGCiL24DgRRgeTFEwPtJL+dSkHbywFbm0
         4UCTNueSYyYs6s1+IPuf/bYI7NKiXqG4UPBZf8f4tQOZNDpekiVAtsQZkqlqiwgtjsCR
         B9kuQyqsK0My79AuZyvnwV9lD+1wHhT36//88RFxA8pwgKryL5BpZBcEjxP+bULHdJfP
         ZZrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:delivered-to;
        bh=FbKs2F7R940NAZ/2QzosuaVfJaXSSM1joLklcNdZxGs=;
        b=D7jwWZ0GHiLPzNVERkqcCkAYq4IY7zMlWOQllIPHqiGDuS1rr4NX8fSEGoOy4Jwzrz
         WNphficy66DPtXZlz2Ul3LwH8QZOxSWFzObhT10FKDn6ce9X+xLA1NNgj+ofnSXJBXwO
         SMhPI7lMUCnD8Wg9qTA99uJLtpAqNPDdhICZQXxwxCi4APZhxbKa7KN1YzWlBomhV3gy
         fqVL5yVW8A4yByJnVGG/lhpu+crwxbOIAUDfpHinv2jQdMoMGMj6xNmGcAC1n/Zd5GC7
         wjLSjekNZcZ9M6LA4A1Qw06gaPjpJfhZEBP333cPqkoGC2dsCJfhmCUTnrPb4+dj4W4I
         n9VA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id b2si15098711pgl.531.2019.02.20.19.16.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 19:16:52 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6507C8926C;
	Thu, 21 Feb 2019 03:16:52 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4328926C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Feb 2019 03:16:51 +0000 (UTC)
Received: from DGGEML404-HUB.china.huawei.com (unknown [172.30.72.57])
 by Forcepoint Email with ESMTP id 302E29166AD6E4C1A203;
 Thu, 21 Feb 2019 11:16:49 +0800 (CST)
Received: from DGGEML511-MBX.china.huawei.com ([169.254.1.219]) by
 DGGEML404-HUB.china.huawei.com ([fe80::b177:a243:7a69:5ab8%31]) with mapi id
 14.03.0415.000; Thu, 21 Feb 2019 11:16:46 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Zhao Yan <yan.y.zhao@intel.com>
Subject: RE: [PATCH 0/5] QEMU VFIO live migration
Thread-Topic: [PATCH 0/5] QEMU VFIO live migration
Thread-Index: AQHUyDBEPflC1EqF60+uk2xDUf0AkqXoj98AgABRUwCAAJEagP//iugAgACZKCA=
Date: Thu, 21 Feb 2019 03:16:45 +0000
Message-ID: <33183CC9F5247A488A2544077AF19020DB25E7CD@dggeml511-mbx.china.huawei.com>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <33183CC9F5247A488A2544077AF19020DB25D374@dggeml511-mbx.china.huawei.com>
 <20190221002444.GH16456@joy-OptiPlex-7040>
 <33183CC9F5247A488A2544077AF19020DB25E1F3@dggeml511-mbx.china.huawei.com>
 <20190221020457.GL16456@joy-OptiPlex-7040>
In-Reply-To: <20190221020457.GL16456@joy-OptiPlex-7040>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.177.18.62]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@Alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>,
 "ziye.yang@intel.com" <ziye.yang@intel.com>,
 "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

CgoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFpoYW8gWWFuIFttYWlsdG86
eWFuLnkuemhhb0BpbnRlbC5jb21dCj4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDIxLCAyMDE5
IDEwOjA1IEFNCj4gVG86IEdvbmdsZWkgKEFyZWkpIDxhcmVpLmdvbmdsZWlAaHVhd2VpLmNvbT4K
PiBDYzogYWxleC53aWxsaWFtc29uQHJlZGhhdC5jb207IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsK
PiBpbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgWmhlbmd4aWFvLnp4QEFsaWJh
YmEtaW5jLmNvbTsKPiB5aS5sLmxpdUBpbnRlbC5jb207IGVza3VsdGV0QHJlZGhhdC5jb207IHpp
eWUueWFuZ0BpbnRlbC5jb207Cj4gY29odWNrQHJlZGhhdC5jb207IHNodWFuZ3RhaS50c3RAYWxp
YmFiYS1pbmMuY29tOyBkZ2lsYmVydEByZWRoYXQuY29tOwo+IHpoaS5hLndhbmdAaW50ZWwuY29t
OyBtbGV2aXRza0ByZWRoYXQuY29tOyBwYXNpY0BsaW51eC5pYm0uY29tOwo+IGFpa0BvemxhYnMu
cnU7IGVhdWdlckByZWRoYXQuY29tOyBmZWxpcGVAbnV0YW5peC5jb207Cj4gam9uYXRoYW4uZGF2
aWVzQG51dGFuaXguY29tOyBjaGFuZ3BlbmcubGl1QGludGVsLmNvbTsgS2VuLlh1ZUBhbWQuY29t
Owo+IGt3YW5raGVkZUBudmlkaWEuY29tOyBrZXZpbi50aWFuQGludGVsLmNvbTsgY2ppYUBudmlk
aWEuY29tOwo+IGt2bUB2Z2VyLmtlcm5lbC5vcmcKPiBTdWJqZWN0OiBSZTogW1BBVENIIDAvNV0g
UUVNVSBWRklPIGxpdmUgbWlncmF0aW9uCj4gCj4gPiA+Cj4gPiA+ID4gNSkgQWJvdXQgbG9nIHN5
bmMsIHdoeSBub3QgcmVnaXN0ZXIgbG9nX2dsb2JhbF9zdGFydC9zdG9wIGluCj4gPiA+IHZmaW9f
bWVtb3J5X2xpc3RlbmVyPwo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gc2VlbXMgbG9nX2dsb2JhbF9z
dGFydC9zdG9wIGNhbm5vdCBiZSBpdGVyYXRlbHkgY2FsbGVkIGluIHByZS1jb3B5IHBoYXNlPwo+
ID4gPiBmb3IgZGlydHkgcGFnZXMgaW4gc3lzdGVtIG1lbW9yeSwgaXQncyBiZXR0ZXIgdG8gdHJh
bnNmZXIgZGlydHkgZGF0YQo+ID4gPiBpdGVyYXRpdmVseSB0byByZWR1Y2UgZG93biB0aW1lLCBy
aWdodD8KPiA+ID4KPiA+Cj4gPiBXZSBqdXN0IG5lZWQgaW52b2tpbmcgb25seSBvbmNlIGZvciBz
dGFydCBhbmQgc3RvcCBsb2dnaW5nLiBXaHkgd2UgbmVlZCB0bwo+IGNhbGwKPiA+IHRoZW0gbGl0
ZXJhdGVseT8gU2VlIG1lbW9yeV9saXN0ZW5lciBvZiB2aG9zdC4KPiA+Cj4gdGhlIGRpcnR5IHBh
Z2VzIGluIHN5c3RlbSBtZW1vcnkgcHJvZHVjZXMgYnkgZGV2aWNlIGlzIGluY3JlbWVudGFsLgo+
IGlmIGl0IGNhbiBiZSBnb3QgaXRlcmF0aXZlbHksIHRoZSBkaXJ0eSBwYWdlcyBpbiBzdG9wLWFu
ZC1jb3B5IHBoYXNlIGNhbiBiZQo+IG1pbmltYWwuCj4gOikKPiAKSSBtZWFuIHN0YXJ0aW5nIG9y
IHN0b3BwaW5nIHRoZSBjYXBhYmlsaXR5IG9mIGxvZ2dpbmcsIG5vdCBsb2cgc3luYy4gCgpXZSBy
ZWdpc3RlciB0aGUgYmVsb3cgY2FsbGJhY2tzOgoKLmxvZ19zeW5jID0gdmZpb19sb2dfc3luYywK
LmxvZ19nbG9iYWxfc3RhcnQgPSB2ZmlvX2xvZ19nbG9iYWxfc3RhcnQsCi5sb2dfZ2xvYmFsX3N0
b3AgPSB2ZmlvX2xvZ19nbG9iYWxfc3RvcCwKClJlZ2FyZHMsCi1Hb25nbGVpCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGlu
ZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==

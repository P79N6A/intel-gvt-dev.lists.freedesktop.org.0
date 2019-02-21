Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp5204258ywa;
        Wed, 20 Feb 2019 21:56:14 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib0MOElASHMv+/tJ18Xdkv2of1jzIxtelnvJe49zvTbBSpi58i8NQyz481Gr+4P5OtgRrOC
X-Received: by 2002:a17:902:22a:: with SMTP id 39mr32860346plc.153.1550728574282;
        Wed, 20 Feb 2019 21:56:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550728574; cv=none;
        d=google.com; s=arc-20160816;
        b=aHwFE6UNMrlbkbFpAlCEQjRv9UJ2GRoRiG5BYEwvcM2U/r8Q90fRovXlrLx10PH+sD
         DrmuGv52RP+UkZLGnkn8RA4gpazq3ifMP4cBh5tWGJs4fq/nw53MisUNDufOsb7nvfed
         w5/5qFnW75Ya6M2RVm/xv0jHulhuMwkUh/Gdnp4cqwT3i7KlowdysDuFj2eNF9T3UjFD
         nfZNjCXGdPwE3V8jx38RLifNz6Zk8CpcXi8ZxBYJdYN+nZ1wXouwei9cqVWrQt8ak8dt
         oeoFfrkOsb3gCftCAmxSSQYsElElcWt1YNM5EBAaUEs0FEx9u8ET1W5mdZgcOU3k+Ir1
         s8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:delivered-to;
        bh=lYuPClaNs7of7TVBjFHB/KxBwrbD1V/dfKfjDbX7B3o=;
        b=AVqehzDAXXWGiRCZQfirLp/v/7CBgEGlSjyo2JRUT5QvdHxzNmOueEBPw+HnUfxj9S
         pAe04sCQFs+mB7hY61KxPxoyo+HeM+bkPVq+BMGpuKUEehgpt8SYtMWw7F13lwMl7D8d
         sJQVUz8aPd5zWC0HWg0EeWaaGeDdDXirkpFXvkiHLbNZV6PKEQkfCkdZAC7ZkEQmmR/c
         YgvRsIHghWsW7w4/kqg7I/YDYmhpOx8460oe8oCNt6YQ9BF7EwyH65z+M78g7+OQ3S8A
         +528xNGbglt7JK6Pcvj/pvg542japzFL4TyUjQ3ytvk09u8rYOcA/Hu60S5pqI4y1p5M
         DtfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id f62si20431860pgc.99.2019.02.20.21.56.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 21:56:14 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C232C88FD2;
	Thu, 21 Feb 2019 05:56:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023AF88FD2
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 21 Feb 2019 05:56:11 +0000 (UTC)
Received: from DGGEML403-HUB.china.huawei.com (unknown [172.30.72.54])
 by Forcepoint Email with ESMTP id 37A3B1A9B7A753058FC0;
 Thu, 21 Feb 2019 13:56:09 +0800 (CST)
Received: from DGGEML423-HUB.china.huawei.com (10.1.199.40) by
 DGGEML403-HUB.china.huawei.com (10.3.17.33) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 21 Feb 2019 13:56:08 +0800
Received: from DGGEML511-MBX.china.huawei.com ([169.254.1.219]) by
 dggeml423-hub.china.huawei.com ([10.1.199.40]) with mapi id 14.03.0415.000;
 Thu, 21 Feb 2019 13:56:05 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Zhao Yan <yan.y.zhao@intel.com>
Subject: RE: [PATCH 0/5] QEMU VFIO live migration
Thread-Topic: [PATCH 0/5] QEMU VFIO live migration
Thread-Index: AQHUyDBEPflC1EqF60+uk2xDUf0AkqXoj98AgABRUwCAAJEagP//iugAgACZKCD//4zngIAAnkOQ
Date: Thu, 21 Feb 2019 05:56:04 +0000
Message-ID: <33183CC9F5247A488A2544077AF19020DB260AD0@dggeml511-mbx.china.huawei.com>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <33183CC9F5247A488A2544077AF19020DB25D374@dggeml511-mbx.china.huawei.com>
 <20190221002444.GH16456@joy-OptiPlex-7040>
 <33183CC9F5247A488A2544077AF19020DB25E1F3@dggeml511-mbx.china.huawei.com>
 <20190221020457.GL16456@joy-OptiPlex-7040>
 <33183CC9F5247A488A2544077AF19020DB25E7CD@dggeml511-mbx.china.huawei.com>
 <20190221042111.GO16456@joy-OptiPlex-7040>
In-Reply-To: <20190221042111.GO16456@joy-OptiPlex-7040>
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

PiA+Cj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+IEZyb206IFpoYW8gWWFu
IFttYWlsdG86eWFuLnkuemhhb0BpbnRlbC5jb21dCj4gPiA+IFNlbnQ6IFRodXJzZGF5LCBGZWJy
dWFyeSAyMSwgMjAxOSAxMDowNSBBTQo+ID4gPiBUbzogR29uZ2xlaSAoQXJlaSkgPGFyZWkuZ29u
Z2xlaUBodWF3ZWkuY29tPgo+ID4gPiBDYzogYWxleC53aWxsaWFtc29uQHJlZGhhdC5jb207IHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZzsKPiA+ID4gaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IFpoZW5neGlhby56eEBBbGliYWJhLWluYy5jb207Cj4gPiA+IHlpLmwubGl1QGludGVs
LmNvbTsgZXNrdWx0ZXRAcmVkaGF0LmNvbTsgeml5ZS55YW5nQGludGVsLmNvbTsKPiA+ID4gY29o
dWNrQHJlZGhhdC5jb207IHNodWFuZ3RhaS50c3RAYWxpYmFiYS1pbmMuY29tOwo+IGRnaWxiZXJ0
QHJlZGhhdC5jb207Cj4gPiA+IHpoaS5hLndhbmdAaW50ZWwuY29tOyBtbGV2aXRza0ByZWRoYXQu
Y29tOyBwYXNpY0BsaW51eC5pYm0uY29tOwo+ID4gPiBhaWtAb3psYWJzLnJ1OyBlYXVnZXJAcmVk
aGF0LmNvbTsgZmVsaXBlQG51dGFuaXguY29tOwo+ID4gPiBqb25hdGhhbi5kYXZpZXNAbnV0YW5p
eC5jb207IGNoYW5ncGVuZy5saXVAaW50ZWwuY29tOwo+IEtlbi5YdWVAYW1kLmNvbTsKPiA+ID4g
a3dhbmtoZWRlQG52aWRpYS5jb207IGtldmluLnRpYW5AaW50ZWwuY29tOyBjamlhQG52aWRpYS5j
b207Cj4gPiA+IGt2bUB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAw
LzVdIFFFTVUgVkZJTyBsaXZlIG1pZ3JhdGlvbgo+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
NSkgQWJvdXQgbG9nIHN5bmMsIHdoeSBub3QgcmVnaXN0ZXIgbG9nX2dsb2JhbF9zdGFydC9zdG9w
IGluCj4gPiA+ID4gPiB2ZmlvX21lbW9yeV9saXN0ZW5lcj8KPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4KPiA+ID4gPiA+IHNlZW1zIGxvZ19nbG9iYWxfc3RhcnQvc3RvcCBjYW5ub3QgYmUgaXRlcmF0
ZWx5IGNhbGxlZCBpbiBwcmUtY29weQo+IHBoYXNlPwo+ID4gPiA+ID4gZm9yIGRpcnR5IHBhZ2Vz
IGluIHN5c3RlbSBtZW1vcnksIGl0J3MgYmV0dGVyIHRvIHRyYW5zZmVyIGRpcnR5IGRhdGEKPiA+
ID4gPiA+IGl0ZXJhdGl2ZWx5IHRvIHJlZHVjZSBkb3duIHRpbWUsIHJpZ2h0Pwo+ID4gPiA+ID4K
PiA+ID4gPgo+ID4gPiA+IFdlIGp1c3QgbmVlZCBpbnZva2luZyBvbmx5IG9uY2UgZm9yIHN0YXJ0
IGFuZCBzdG9wIGxvZ2dpbmcuIFdoeSB3ZSBuZWVkCj4gdG8KPiA+ID4gY2FsbAo+ID4gPiA+IHRo
ZW0gbGl0ZXJhdGVseT8gU2VlIG1lbW9yeV9saXN0ZW5lciBvZiB2aG9zdC4KPiA+ID4gPgo+ID4g
PiB0aGUgZGlydHkgcGFnZXMgaW4gc3lzdGVtIG1lbW9yeSBwcm9kdWNlcyBieSBkZXZpY2UgaXMg
aW5jcmVtZW50YWwuCj4gPiA+IGlmIGl0IGNhbiBiZSBnb3QgaXRlcmF0aXZlbHksIHRoZSBkaXJ0
eSBwYWdlcyBpbiBzdG9wLWFuZC1jb3B5IHBoYXNlIGNhbiBiZQo+ID4gPiBtaW5pbWFsLgo+ID4g
PiA6KQo+ID4gPgo+ID4gSSBtZWFuIHN0YXJ0aW5nIG9yIHN0b3BwaW5nIHRoZSBjYXBhYmlsaXR5
IG9mIGxvZ2dpbmcsIG5vdCBsb2cgc3luYy4KPiA+Cj4gPiBXZSByZWdpc3RlciB0aGUgYmVsb3cg
Y2FsbGJhY2tzOgo+ID4KPiA+IC5sb2dfc3luYyA9IHZmaW9fbG9nX3N5bmMsCj4gPiAubG9nX2ds
b2JhbF9zdGFydCA9IHZmaW9fbG9nX2dsb2JhbF9zdGFydCwKPiA+IC5sb2dfZ2xvYmFsX3N0b3Ag
PSB2ZmlvX2xvZ19nbG9iYWxfc3RvcCwKPiA+Cj4gLmxvZ19nbG9iYWxfc3RhcnQgaXMgYWxzbyBh
IGdvb2QgcG9pbnQgdG8gbm90aWZ5IGxvZ2dpbmcgc3RhdGUuCj4gQnV0IGlmIG5vdGlmeWluZyBp
biAuc2F2ZV9zZXR1cCBoYW5kbGVyLCB3ZSBjYW4gZG8gZmluZS1ncmFpbmVkCj4gY29udHJvbCBv
ZiB3aGVuIHRvIG5vdGlmeSBvZiBsb2dnaW5nIHN0YXJ0aW5nIHRvZ2V0aGVyIHdpdGggZ2V0X2J1
ZmZlcgo+IG9wZXJhdGlvbi4KPiBJcyB0aGVyZSBhbnkgc3BlY2lhbCBiZW5pZml0IGJ5IHJlZ2lz
dGVyaW5nIHRvIC5sb2dfZ2xvYmFsX3N0YXJ0L3N0b3A/Cj4gCgpQZXJmb3JtYW5jZSBiZW5lZml0
IHdoZW4gb25lIFZNIGhhcyBtdWx0aXBsZSBzYW1lIHZmaW8gZGV2aWNlcy4KCgpSZWdhcmRzLAot
R29uZ2xlaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
bnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVs
LWd2dC1kZXY=

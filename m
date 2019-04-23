Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3263712ywo;
        Tue, 23 Apr 2019 03:24:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkokz7pLGMmoDuScf4JDvR5bM2EYnzYPLO91sw4ir1DemLFbuUvyABUPV56mzOXZGW3OPF
X-Received: by 2002:a63:6cc7:: with SMTP id h190mr23381913pgc.350.1556015083279;
        Tue, 23 Apr 2019 03:24:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556015083; cv=none;
        d=google.com; s=arc-20160816;
        b=06zDFXF6RuL56TYiWtqsQZ0nM9LSqjnEjNssJVDbWhgpL0GhPgi0Z0rLXPjN+gY0FY
         FQ1XsMetGEJ44B0vPdR17sDTsHxH9fHPWZe3+IazdkzIaPRAzMpU0aSiUK/BKeaGgkS9
         zOHIlnaHnEUq+l60oZb2G1Af9YdnxCCM9JzlCTEp5Jiy5wig1d+NAex2G2/gDyOFlGw0
         5gYPid3sLAVLGh9byOGBLGZJ1tSG9IWCHQ/g7b/BHgDnNUuD4/kQ2MlhTZbgsZP8MD0u
         mWytBvaD/I86npunyaNEn2BMbDm+LuAY79wjoAwXciBP474TvJEG0vkI8nEBXtsR5P6X
         gc7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:reply-to
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=+yvMsD/GvyDLVln72CPTXf+71WLikd+XxoZNvusy9Y0=;
        b=V80UKVoBWHxois31LmJm8TRpwiLJg33FMd849gmU7FGFugwBdP8iKWulLUeDCsNWN3
         W0xjr3OqJgkZzFMBkXTHxEc9p7JKrXkaid4gb6HtN8G1EAiIyN2NJKgAIIkj/K14JvBE
         ek9cNU6Hp/NIx0PjSRGWZv0CzGBTlw5B3Y4EPC3nOja3Thie43d8KF2ve0W2lY4hVKrz
         jwEcs+ZM128VqHx/f/jUmi1B6VcC6nW/NJfAvplEqNS4WKKrJEzITAJNfb28n+3nn04M
         y6xs/Xj+g6k/uyFeewOJ3UOVHhs+tZZgpVG1M4qCprbjFOxaQGhl7wnFVZH02CW5R+LA
         OVUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id t26si14269128pgu.327.2019.04.23.03.24.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2019 03:24:43 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBAB892BD;
	Tue, 23 Apr 2019 10:24:42 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0E0892BD
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Apr 2019 10:24:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 87D4D307CDD6;
 Tue, 23 Apr 2019 10:24:39 +0000 (UTC)
Received: from redhat.com (ovpn-112-50.ams2.redhat.com [10.36.112.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADD1817CC4;
 Tue, 23 Apr 2019 10:24:22 +0000 (UTC)
Date: Tue, 23 Apr 2019 11:24:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [Qemu-devel] [PATCH 1/2] vfio/mdev: add version field as
 mandatory attribute for mdev device
Message-ID: <20190423102419.GE6022@redhat.com>
References: <20190419083258.19580-1-yan.y.zhao@intel.com>
 <20190419083505.19654-1-yan.y.zhao@intel.com>
 <20190422083950.25eb9e7c@x1.home>
 <20190423010152.GC32217@joy-OptiPlex-7040>
 <20190422192100.4d577e4b@x1.home>
 <20190423054157.GA26190@joy-OptiPlex-7040>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190423054157.GA26190@joy-OptiPlex-7040>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 23 Apr 2019 10:24:40 +0000 (UTC)
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "He,
 Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMjMsIDIwMTkgYXQgMDE6NDE6NTdBTSAtMDQwMCwgWWFuIFpoYW8gd3JvdGU6
Cj4gT24gVHVlLCBBcHIgMjMsIDIwMTkgYXQgMDk6MjE6MDBBTSArMDgwMCwgQWxleCBXaWxsaWFt
c29uIHdyb3RlOgo+ID4gT24gTW9uLCAyMiBBcHIgMjAxOSAyMTowMTo1MiAtMDQwMAo+ID4gWWFu
IFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29tPiB3cm90ZToKPiA+IAo+ID4gPiBPbiBNb24sIEFw
ciAyMiwgMjAxOSBhdCAxMDozOTo1MFBNICswODAwLCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4g
PiA+ID4gT24gRnJpLCAxOSBBcHIgMjAxOSAwNDozNTowNCAtMDQwMAo+ID4gPiA+IFlhbiBaaGFv
IDx5YW4ueS56aGFvQGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gICAKPiA+ID4gPiA+IGRldmlj
ZSB2ZXJzaW9uIGF0dHJpYnV0ZSBpbiBtZGV2IHN5c2ZzIGlzIHVzZWQgYnkgdXNlciBzcGFjZSBz
b2Z0d2FyZQo+ID4gPiA+ID4gKGUuZy4gbGlidmlydCkgdG8gcXVlcnkgZGV2aWNlIGNvbXBhdGli
aWxpdHkgZm9yIGxpdmUgbWlncmF0aW9uIG9mIFZGSU8KPiA+ID4gPiA+IG1kZXYgZGV2aWNlcy4g
VGhpcyBhdHRyaWJ1dGUgaXMgbWFuZGF0b3J5IGlmIGEgbWRldiBkZXZpY2Ugc3VwcG9ydHMgbGl2
ZQo+ID4gPiA+ID4gbWlncmF0aW9uLiAgCj4gPiA+ID4gCj4gPiA+ID4gVGhlIFN1YmplY3Q6IGRv
ZXNuJ3QgcXVpdGUgbWF0Y2ggd2hhdCdzIGJlaW5nIHByb3Bvc2VkIGhlcmUuCj4gPiA+ID4gICAg
Cj4gPiA+ID4gPiBJdCBjb25zaXN0cyBvZiB0d28gcGFydHM6IGNvbW1vbiBwYXJ0IGFuZCB2ZW5k
b3IgcHJvcHJpZXRhcnkgcGFydC4KPiA+ID4gPiA+IGNvbW1vbiBwYXJ0OiAzMiBiaXQuIGxvd2Vy
IDE2IGJpdHMgaXMgdmVuZG9yIGlkIGFuZCBoaWdoZXIgMTYgYml0cwo+ID4gPiA+ID4gICAgICAg
ICAgICAgIGlkZW50aWZpZXMgZGV2aWNlIHR5cGUuIGUuZy4sIGZvciBwY2kgZGV2aWNlLCBpdCBp
cwo+ID4gPiA+ID4gICAgICAgICAgICAgICJwY2kgdmVuZG9yIGlkIiB8IChWRklPX0RFVklDRV9G
TEFHU19QQ0kgPDwgMTYpLiAgCj4gPiA+ID4gCj4gPiA+ID4gV2hhdCBwdXJwb3NlIGRvZXMgdGhp
cyBzZXJ2ZT8gIElmIGl0J3MgaW50ZW5kZWQgYXMgc29tZSBzb3J0IG9mCj4gPiA+ID4gbmFtZXNw
YWNlIGZlYXR1cmUsIHNob3VsZG4ndCB3ZSBmaXJzdCBhc3N1bWUgdGhhdCB3ZSBjYW4gb25seSBz
dXBwb3J0Cj4gPiA+ID4gbWlncmF0aW9uIHRvIGRldmljZXMgb2YgdGhlIHNhbWUgdHlwZT8gIFRo
ZXJlZm9yZSBlYWNoIHR5cGUgd291bGQKPiA+ID4gPiBhbHJlYWR5IGhhdmUgaXRzIG93biBuYW1l
c3BhY2UuICBBbHNvIHRoYXQgd291bGQgbWFrZSB0aGUgdHJhaWxpbmcgYml0Cj4gPiA+ID4gb2Yg
dGhlIHZlcnNpb24gc3RyaW5nIGxpc3RlZCBiZWxvdyBpbiB0aGUgZXhhbXBsZSByZWR1bmRhbnQu
ICBBIHZlbmRvcgo+ID4gPiA+IGlzIHN0aWxsIHdlbGNvbWUgdG8gaW5jbHVkZSB0aGlzIGluIHRo
ZWlyIHZlcnNpb24gc3RyaW5nIGlmIHRoZXkgd2lzaCwKPiA+ID4gPiBidXQgSSB0aGluayB0aGUg
c3RyaW5nIHNob3VsZCBiZSBlbnRpcmVseSB2ZW5kb3IgZGVmaW5lZC4KPiA+ID4gPiAgCj4gPiA+
IGhpIEFsZXgsCj4gPiA+IFRoaXMgY29tbW9uIHBhcnQgaXMgYSBraW5kIG9mIG5hbWVzcGFjZS4K
PiA+ID4gQmVjYXVzZSBpZiB2ZXJzaW9uIHN0cmluZyBpcyBlbnRpcmVseSBkZWZpbmVkIGJ5IHZl
bmRvcnMsIEknbSB3b3JyaWVkIGFib3V0Cj4gPiA+IGlmIHRoZXJlIGlzIGEgY2FzZSB0aGF0IG9u
ZSB2ZW5kb3IncyB2ZXJzaW9uIHN0cmluZyBoYXBwZW5zIHRvIGRlY2VpdmUgYW5kCj4gPiA+IGlu
dGVyZmVyZSB3aXRoIGFub3RoZXIgdmVuZG9yJ3MgdmVyc2lvbiBjaGVja2luZz8KPiA+ID4gZS5n
Lgo+ID4gPiB2ZW5kb3IgQSBoYXMgYSB2ZXJzaW9uIHN0cmluZyBsaWtlOiB2ZW5kb3IgaWQgKyBk
ZXZpY2UgaWQgKyBtZGV2IHR5cGUKPiA+ID4gdmVuZG9yIEIgaGFzIGEgdmVyc2lvbiBzdHJpbmcg
bGlrZTogZGV2aWNlIGlkICsgdmVuZG9yIGlkICsgbWRldiB0eXBlCj4gPiA+IGJ1dCB2ZW5kb3Ig
QSdzIHZlbmRvciBpZCBpcyAweDgwODYsIGRldmljZSBpZCBpcyAweDEyMTcKPiA+ID4gdmVuZG9y
IEIncyB2ZW5kb3IgaWQgaXMgMHgxMjE3LCBkZXZpY2UgaWQgaXMgMHg4MDg2Lgo+ID4gPiAKPiA+
ID4gSW4gdGhpcyBjb3JuZXIgY2FzZSwgdGhlIHR3byB2ZW5kb3JzIG1heSByZWdhcmQgdGhlIHR3
byBkZXZpY2UgaXMKPiA+ID4gbWlncmF0YWJsZSBidXQgYWN0dWFsbHkgdGhleSBhcmUgbm90Lgo+
ID4gPiAKPiA+ID4gVGhhdCdzIHRoZSByZWFzb24gZm9yIHRoaXMgY29tbW9uIHBhcnQgdGhhdCBz
ZXJ2ZSBhcyBhIGtpbmQgb2YgbmFtZXNwYWNlCj4gPiA+IHRoYXQgYWxsIHZlbmRvcnMgd2lsbCBj
b21wbHkgd2l0aCB0byBhdm9pZCBvdmVybGFwLgo+ID4gCj4gPiBJZiB3ZSBhc3N1bWUgdGhhdCBt
aWdyYXRpb24gY2FuIG9ubHkgb2NjdXIgYmV0d2VlbiBtYXRjaGluZyBtZGV2IHR5cGVzLAo+ID4g
dGhpcyBpcyByZWR1bmRhbnQsIGVhY2ggdHlwZSBhbHJlYWR5IGhhcyB0aGVpciBvd24gbmFtZXNw
YWNlLgo+ID4KPiBoaSBBbGV4LAo+IGRvIHlvdSBtZWFuIHVzZXIgc3BhY2Ugc29mdHdhcmUgbGlr
ZSBsaWJ2aXJ0IG5lZWRzIHRvIGZpcnN0IGNoZWNrIHdoZXRoZXIKPiBtZGV2IHR5cGUgaXMgbWF0
Y2hpbmcgYW5kIHRoZW4gY2hlY2sgd2hldGhlciB2ZXJzaW9uIGlzIG1hdGNoaW5nPwoKSSB3b3Vs
ZCBleHBlY3QgdGhhdCBsaWJ2aXJ0IChvciBvdGhlciBtZ210IGFwcHMpIHdpbGwgYWx3YXlzIGZp
cnN0CmNoZWNrIHRoYXQgdGhlIHZlbmRvciBpZCwgZGV2aWNlIGlkLCBtZGV2IHR5cGUgYWxsIG1h
dGNoLiBTbyBmb3IgdGhlCnZlcnNpb24gc3RyaW5nIGl0IHNob3VsZCBzdWZmaWNlIHRvIGJlIGEg
Im5vcm1hbCIgbnVtZXJpYyB2YWx1ZS4KCkVzc2VudGlhbGx5IHZlcnNpb24gc3RyaW5nIGp1c3Qg
bmVlZHMgdG8gYmUgdGhlcmUgdG8gZGlzdGluZ3Vpc2gKcmV2aXNpb25zIG9mIHRoZSBzYW1lIG1k
ZXYgdHlwZSBvdmVyIHRpbWUuCgoKUmVnYXJkcywKRGFuaWVsCi0tIAp8OiBodHRwczovL2JlcnJh
bmdlLmNvbSAgICAgIC1vLSAgICBodHRwczovL3d3dy5mbGlja3IuY29tL3Bob3Rvcy9kYmVycmFu
Z2UgOnwKfDogaHR0cHM6Ly9saWJ2aXJ0Lm9yZyAgICAgICAgIC1vLSAgICAgICAgICAgIGh0dHBz
Oi8vZnN0b3AxMzguYmVycmFuZ2UuY29tIDp8Cnw6IGh0dHBzOi8vZW50YW5nbGUtcGhvdG8ub3Jn
ICAgIC1vLSAgICBodHRwczovL3d3dy5pbnN0YWdyYW0uY29tL2RiZXJyYW5nZSA6fApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1h
aWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=

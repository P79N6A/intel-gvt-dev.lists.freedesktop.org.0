Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3230963ywo;
        Tue, 23 Apr 2019 02:46:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwRPcY+TEl207AexIbc+noou08QL9ZnhQ8HIF/usABvEMUCXBhWEZPXStcR5RKbI+iP1pRY
X-Received: by 2002:a62:1c54:: with SMTP id c81mr7603384pfc.122.1556012771748;
        Tue, 23 Apr 2019 02:46:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556012771; cv=none;
        d=google.com; s=arc-20160816;
        b=RuzVr503bpLz2cDlouxnPYXLwO8T1Cd3vyvsiOQJn+ROBuTm8r4OelqzlY++2rNnx4
         hZenSUxitZvFjmMpi9BDbYdMGDXCn0b/zuRt7bNVvyHJFqp+VYOySBkYTmAAFnjnm7XR
         jtwrPKT2jcxyQvtwybzerKZQWzB2G6eKB+P8HyPk+5BiAzR6LfzDl03dF8qV6Jj/x86+
         NT8fcLPB2MnhyEyOXVsXAfeQ68CcqWRnjT8EWZPIOFOSj56gs4gDisUpUyT3KVsG/LQr
         5VyxiX4uhsVyUxNgmYdOUKYfbZ+qEQYpnEg94OQY1r0aK0+dWv13t85jQUaNkklctt/8
         8JuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:organization:references:in-reply-to
         :message-id:subject:to:from:date:delivered-to;
        bh=giDfLBaLulMT1sls8nrozCDliu8a3xRQE04H1pQd698=;
        b=H1SBrWGK3wRu//cBsT4dFX8yxNGnrTj6Crn5be3cpvKeZxywtfZ218VKzhvdyu5PwG
         WpnqHy/j6X58SpRuLXz4fXUfPhAuecKuAt7EG7y1LccAtbrl786qmT9wleIdNxnUGRQ/
         JXxShE5Mx9V2QiAK0TiLyfFne+VF37e53M2tkqaWK+2qjA9pkUW3RpufpptvnuWDeZWB
         OtFSOiIKbjp0powe8WkL2ZK95wcEv1kBhkdZAkIiKcMpbHiu4BtKyqfjTCjofzx8cT0c
         bNl4GqDeVgmsvETN4jAsgjP8whQEF/a3OWje1SS0dVINAIi5iVa3dOrEeBeHgEMlQCgV
         /N9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id b74si15546940pfj.121.2019.04.23.02.46.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2019 02:46:11 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1810189057;
	Tue, 23 Apr 2019 09:46:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D0E89057
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 23 Apr 2019 09:46:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 40D583007C43;
 Tue, 23 Apr 2019 09:46:08 +0000 (UTC)
Received: from gondolin (dhcp-192-187.str.redhat.com [10.33.192.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE6761A919;
 Tue, 23 Apr 2019 09:45:58 +0000 (UTC)
Date: Tue, 23 Apr 2019 11:45:56 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 1/2] vfio/mdev: add version field as mandatory attribute
 for mdev device
Message-ID: <20190423114556.1ef69f47.cohuck@redhat.com>
In-Reply-To: <20190423054157.GA26190@joy-OptiPlex-7040>
References: <20190419083258.19580-1-yan.y.zhao@intel.com>
 <20190419083505.19654-1-yan.y.zhao@intel.com>
 <20190422083950.25eb9e7c@x1.home>
 <20190423010152.GC32217@joy-OptiPlex-7040>
 <20190422192100.4d577e4b@x1.home>
 <20190423054157.GA26190@joy-OptiPlex-7040>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 23 Apr 2019 09:46:08 +0000 (UTC)
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "He,
 Shaopeng" <shaopeng.he@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVHVlLCAyMyBBcHIgMjAxOSAwMTo0MTo1NyAtMDQwMApZYW4gWmhhbyA8eWFuLnkuemhhb0Bp
bnRlbC5jb20+IHdyb3RlOgoKPiBPbiBUdWUsIEFwciAyMywgMjAxOSBhdCAwOToyMTowMEFNICsw
ODAwLCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4gPiBPbiBNb24sIDIyIEFwciAyMDE5IDIxOjAx
OjUyIC0wNDAwCj4gPiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRlbC5jb20+IHdyb3RlOgo+ID4g
ICAKPiA+ID4gT24gTW9uLCBBcHIgMjIsIDIwMTkgYXQgMTA6Mzk6NTBQTSArMDgwMCwgQWxleCBX
aWxsaWFtc29uIHdyb3RlOiAgCj4gPiA+ID4gT24gRnJpLCAxOSBBcHIgMjAxOSAwNDozNTowNCAt
MDQwMAo+ID4gPiA+IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+
ID4gICAgIAo+ID4gPiA+ID4gZGV2aWNlIHZlcnNpb24gYXR0cmlidXRlIGluIG1kZXYgc3lzZnMg
aXMgdXNlZCBieSB1c2VyIHNwYWNlIHNvZnR3YXJlCj4gPiA+ID4gPiAoZS5nLiBsaWJ2aXJ0KSB0
byBxdWVyeSBkZXZpY2UgY29tcGF0aWJpbGl0eSBmb3IgbGl2ZSBtaWdyYXRpb24gb2YgVkZJTwo+
ID4gPiA+ID4gbWRldiBkZXZpY2VzLiBUaGlzIGF0dHJpYnV0ZSBpcyBtYW5kYXRvcnkgaWYgYSBt
ZGV2IGRldmljZSBzdXBwb3J0cyBsaXZlCj4gPiA+ID4gPiBtaWdyYXRpb24uICAgIAo+ID4gPiA+
IAo+ID4gPiA+IFRoZSBTdWJqZWN0OiBkb2Vzbid0IHF1aXRlIG1hdGNoIHdoYXQncyBiZWluZyBw
cm9wb3NlZCBoZXJlLgo+ID4gPiA+ICAgICAgCj4gPiA+ID4gPiBJdCBjb25zaXN0cyBvZiB0d28g
cGFydHM6IGNvbW1vbiBwYXJ0IGFuZCB2ZW5kb3IgcHJvcHJpZXRhcnkgcGFydC4KPiA+ID4gPiA+
IGNvbW1vbiBwYXJ0OiAzMiBiaXQuIGxvd2VyIDE2IGJpdHMgaXMgdmVuZG9yIGlkIGFuZCBoaWdo
ZXIgMTYgYml0cwo+ID4gPiA+ID4gICAgICAgICAgICAgIGlkZW50aWZpZXMgZGV2aWNlIHR5cGUu
IGUuZy4sIGZvciBwY2kgZGV2aWNlLCBpdCBpcwo+ID4gPiA+ID4gICAgICAgICAgICAgICJwY2kg
dmVuZG9yIGlkIiB8IChWRklPX0RFVklDRV9GTEFHU19QQ0kgPDwgMTYpLiAgICAKPiA+ID4gPiAK
PiA+ID4gPiBXaGF0IHB1cnBvc2UgZG9lcyB0aGlzIHNlcnZlPyAgSWYgaXQncyBpbnRlbmRlZCBh
cyBzb21lIHNvcnQgb2YKPiA+ID4gPiBuYW1lc3BhY2UgZmVhdHVyZSwgc2hvdWxkbid0IHdlIGZp
cnN0IGFzc3VtZSB0aGF0IHdlIGNhbiBvbmx5IHN1cHBvcnQKPiA+ID4gPiBtaWdyYXRpb24gdG8g
ZGV2aWNlcyBvZiB0aGUgc2FtZSB0eXBlPyAgVGhlcmVmb3JlIGVhY2ggdHlwZSB3b3VsZAo+ID4g
PiA+IGFscmVhZHkgaGF2ZSBpdHMgb3duIG5hbWVzcGFjZS4gIEFsc28gdGhhdCB3b3VsZCBtYWtl
IHRoZSB0cmFpbGluZyBiaXQKPiA+ID4gPiBvZiB0aGUgdmVyc2lvbiBzdHJpbmcgbGlzdGVkIGJl
bG93IGluIHRoZSBleGFtcGxlIHJlZHVuZGFudC4gIEEgdmVuZG9yCj4gPiA+ID4gaXMgc3RpbGwg
d2VsY29tZSB0byBpbmNsdWRlIHRoaXMgaW4gdGhlaXIgdmVyc2lvbiBzdHJpbmcgaWYgdGhleSB3
aXNoLAo+ID4gPiA+IGJ1dCBJIHRoaW5rIHRoZSBzdHJpbmcgc2hvdWxkIGJlIGVudGlyZWx5IHZl
bmRvciBkZWZpbmVkLgo+ID4gPiA+ICAgIAo+ID4gPiBoaSBBbGV4LAo+ID4gPiBUaGlzIGNvbW1v
biBwYXJ0IGlzIGEga2luZCBvZiBuYW1lc3BhY2UuCj4gPiA+IEJlY2F1c2UgaWYgdmVyc2lvbiBz
dHJpbmcgaXMgZW50aXJlbHkgZGVmaW5lZCBieSB2ZW5kb3JzLCBJJ20gd29ycmllZCBhYm91dAo+
ID4gPiBpZiB0aGVyZSBpcyBhIGNhc2UgdGhhdCBvbmUgdmVuZG9yJ3MgdmVyc2lvbiBzdHJpbmcg
aGFwcGVucyB0byBkZWNlaXZlIGFuZAo+ID4gPiBpbnRlcmZlcmUgd2l0aCBhbm90aGVyIHZlbmRv
cidzIHZlcnNpb24gY2hlY2tpbmc/Cj4gPiA+IGUuZy4KPiA+ID4gdmVuZG9yIEEgaGFzIGEgdmVy
c2lvbiBzdHJpbmcgbGlrZTogdmVuZG9yIGlkICsgZGV2aWNlIGlkICsgbWRldiB0eXBlCj4gPiA+
IHZlbmRvciBCIGhhcyBhIHZlcnNpb24gc3RyaW5nIGxpa2U6IGRldmljZSBpZCArIHZlbmRvciBp
ZCArIG1kZXYgdHlwZQo+ID4gPiBidXQgdmVuZG9yIEEncyB2ZW5kb3IgaWQgaXMgMHg4MDg2LCBk
ZXZpY2UgaWQgaXMgMHgxMjE3Cj4gPiA+IHZlbmRvciBCJ3MgdmVuZG9yIGlkIGlzIDB4MTIxNywg
ZGV2aWNlIGlkIGlzIDB4ODA4Ni4KPiA+ID4gCj4gPiA+IEluIHRoaXMgY29ybmVyIGNhc2UsIHRo
ZSB0d28gdmVuZG9ycyBtYXkgcmVnYXJkIHRoZSB0d28gZGV2aWNlIGlzCj4gPiA+IG1pZ3JhdGFi
bGUgYnV0IGFjdHVhbGx5IHRoZXkgYXJlIG5vdC4KPiA+ID4gCj4gPiA+IFRoYXQncyB0aGUgcmVh
c29uIGZvciB0aGlzIGNvbW1vbiBwYXJ0IHRoYXQgc2VydmUgYXMgYSBraW5kIG9mIG5hbWVzcGFj
ZQo+ID4gPiB0aGF0IGFsbCB2ZW5kb3JzIHdpbGwgY29tcGx5IHdpdGggdG8gYXZvaWQgb3Zlcmxh
cC4gIAo+ID4gCj4gPiBJZiB3ZSBhc3N1bWUgdGhhdCBtaWdyYXRpb24gY2FuIG9ubHkgb2NjdXIg
YmV0d2VlbiBtYXRjaGluZyBtZGV2IHR5cGVzLAo+ID4gdGhpcyBpcyByZWR1bmRhbnQsIGVhY2gg
dHlwZSBhbHJlYWR5IGhhcyB0aGVpciBvd24gbmFtZXNwYWNlLgo+ID4gIAo+IGhpIEFsZXgsCj4g
ZG8geW91IG1lYW4gdXNlciBzcGFjZSBzb2Z0d2FyZSBsaWtlIGxpYnZpcnQgbmVlZHMgdG8gZmly
c3QgY2hlY2sgd2hldGhlcgo+IG1kZXYgdHlwZSBpcyBtYXRjaGluZyBhbmQgdGhlbiBjaGVjayB3
aGV0aGVyIHZlcnNpb24gaXMgbWF0Y2hpbmc/Cj4gCj4gaWYgdXNlciBzcGFjZSBzb2Z0d2FyZSBv
bmx5IGNoZWNrcyB2ZXJzaW9uIGZvciBtaWdyYXRpb24sIGl0IG1lYW5zIHZlbmRvcgo+IGRyaXZl
ciBoYXMgdG8gaW5jbHVkZSBtZGV2IHR5cGUgaW4gdGhlaXIgdmVuZG9yIHByb3ByaWV0YXJ5IHBh
cnQgc3RyaW5nLAo+IHJpZ2h0PwoKQ2FuJ3QgdXNlcnNwYWNlIHNpbXBseSBjaGVjayBmb3IgdGhl
IGRyaXZlciBpbiB1c2UgYW5kIG9ubHkgdGhlbiBjaGVjawp0aGUgdmVyc2lvbiBhdHRyaWJ1dGU/
Cgo+IEFub3RoZXIgdGhpbmcgaXMgdGhhdCBjb3VsZCB0aGVyZSBiZSBhbnkgZnV0dXJlIG1kZXYg
cGFyZW50IGRyaXZlciB0aGF0Cj4gYXBwbGllcyB0byBhbGwgbWRldiBkZXZpY2VzLCBqdXN0IGxp
a2UgdmZpby1wY2k/IGxpa2UgWWkncyB2ZmlvLXBjaS1tZGV2Cj4gZHJpdmVyIChodHRwczovL2xr
bWwub3JnL2xrbWwvMjAxOS8zLzEzLzExNCk/CgpIbSwgSSB0aGluayB0aGF0IHRoZSB2ZmlvLXBj
aS1tZGV2IGRyaXZlciB0aGVuIG5lZWRzIHRvIGV4cG9zZQppbmZvcm1hdGlvbiByZWdhcmRpbmcg
Y29tcGF0aWJpbGl0eSAoYW5kIG5vdCB0aGUgY29yZSkuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVs
LWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==

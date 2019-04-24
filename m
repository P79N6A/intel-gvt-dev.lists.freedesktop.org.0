Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp97171ywo;
        Tue, 23 Apr 2019 20:39:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxMiSzgg+pcWIiwYgHeei2MKyFvXhAwETwOTsQ203vY2gjF3Rigo1ceB82dJc7dhiBsX038
X-Received: by 2002:a17:902:e704:: with SMTP id co4mr30893883plb.30.1556077168063;
        Tue, 23 Apr 2019 20:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556077168; cv=none;
        d=google.com; s=arc-20160816;
        b=dofw4o1AvB0S4XBZ+z6vFUMVD1Xw3LvmtqdG6U4aOwOwVSQjOLtwVIP1xcFFt4C1rJ
         AcnKn2O4WGw4e1iNZQ6JISjyawA2jk9TR87DWCV/itXkj+Dm0kjtPrPQddLZeaPmofnt
         Hv0ojxI3YBjfOR1Qw6TZEUb+Pey2AQTd8fE/8Ni1pRYxVCaeE6iRjyeaWYVsIjvWGZxb
         l2X4vQTUbrzv8YFDtIXttuaI0aWtIgwO/RWsvy0TP+ZAUOMt5AidngI9BdGndKd704oq
         XoIvgH0Xece8Yi+ZiLMIUPsMQLisO61mjLwhMiZDQsxMkb/skCkz+mg+Qxc5ABz1EFCy
         AtYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:reply-to
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=L52uD/4ny/p7TPBaF7jvXnQcWnC4mVlNkS4arR0R688=;
        b=Ojrx0twCef2AsQAR3C8NwWEV7QaA5HEW/vIL/V1/ijGOPEdk06/SnPsORmDQeUp1jp
         XUlvyPVMNeF912nX3kV1b6ybjiMYwcZda7Swz1+lcbIkjKry+IBKGAZQ6d5ySdbzzHfl
         M630aXBbmtVEZ4bBMy3rPiw+16R6PxsRLLoTVSsI7Lmv+JwpHvIpju0Hx5KozpHVmU1W
         C+OivAP0vpZRs3CdsxP9Zzfzny/TvScUif5zJyYmxR2LJ3EzUTFEq7PzUypgG6esEYuY
         0OPCrnyRlrnizaWxZIycxH7Q1qLukDsqgSB0q2zWHXrUFN7R2BPN40fd1cJ/IAQt6W9E
         8/Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id q13si19558718pfi.208.2019.04.23.20.39.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2019 20:39:28 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00696896E4;
	Wed, 24 Apr 2019 03:39:27 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E58D896E4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 24 Apr 2019 03:39:25 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Apr 2019 20:39:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,388,1549958400"; d="scan'208";a="164506938"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by fmsmga004.fm.intel.com with ESMTP; 23 Apr 2019 20:39:19 -0700
Date: Tue, 23 Apr 2019 23:33:46 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/2] vfio/mdev: add version field as
 mandatory attribute for mdev device
Message-ID: <20190424033346.GC26247@joy-OptiPlex-7040>
References: <20190419083258.19580-1-yan.y.zhao@intel.com>
 <20190419083505.19654-1-yan.y.zhao@intel.com>
 <20190422083950.25eb9e7c@x1.home>
 <20190423010152.GC32217@joy-OptiPlex-7040>
 <20190422192100.4d577e4b@x1.home>
 <20190423054157.GA26190@joy-OptiPlex-7040>
 <20190423102419.GE6022@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190423102419.GE6022@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
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

T24gVHVlLCBBcHIgMjMsIDIwMTkgYXQgMDY6MjQ6MTlQTSArMDgwMCwgRGFuaWVsIFAuIEJlcnJh
bmfDqSB3cm90ZToKPiBPbiBUdWUsIEFwciAyMywgMjAxOSBhdCAwMTo0MTo1N0FNIC0wNDAwLCBZ
YW4gWmhhbyB3cm90ZToKPiA+IE9uIFR1ZSwgQXByIDIzLCAyMDE5IGF0IDA5OjIxOjAwQU0gKzA4
MDAsIEFsZXggV2lsbGlhbXNvbiB3cm90ZToKPiA+ID4gT24gTW9uLCAyMiBBcHIgMjAxOSAyMTow
MTo1MiAtMDQwMAo+ID4gPiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRlbC5jb20+IHdyb3RlOgo+
ID4gPgo+ID4gPiA+IE9uIE1vbiwgQXByIDIyLCAyMDE5IGF0IDEwOjM5OjUwUE0gKzA4MDAsIEFs
ZXggV2lsbGlhbXNvbiB3cm90ZToKPiA+ID4gPiA+IE9uIEZyaSwgMTkgQXByIDIwMTkgMDQ6MzU6
MDQgLTA0MDAKPiA+ID4gPiA+IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4gd3JvdGU6
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gPiBkZXZpY2UgdmVyc2lvbiBhdHRyaWJ1dGUgaW4gbWRldiBz
eXNmcyBpcyB1c2VkIGJ5IHVzZXIgc3BhY2Ugc29mdHdhcmUKPiA+ID4gPiA+ID4gKGUuZy4gbGli
dmlydCkgdG8gcXVlcnkgZGV2aWNlIGNvbXBhdGliaWxpdHkgZm9yIGxpdmUgbWlncmF0aW9uIG9m
IFZGSU8KPiA+ID4gPiA+ID4gbWRldiBkZXZpY2VzLiBUaGlzIGF0dHJpYnV0ZSBpcyBtYW5kYXRv
cnkgaWYgYSBtZGV2IGRldmljZSBzdXBwb3J0cyBsaXZlCj4gPiA+ID4gPiA+IG1pZ3JhdGlvbi4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGUgU3ViamVjdDogZG9lc24ndCBxdWl0ZSBtYXRjaCB3aGF0
J3MgYmVpbmcgcHJvcG9zZWQgaGVyZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEl0IGNvbnNpc3Rz
IG9mIHR3byBwYXJ0czogY29tbW9uIHBhcnQgYW5kIHZlbmRvciBwcm9wcmlldGFyeSBwYXJ0Lgo+
ID4gPiA+ID4gPiBjb21tb24gcGFydDogMzIgYml0LiBsb3dlciAxNiBiaXRzIGlzIHZlbmRvciBp
ZCBhbmQgaGlnaGVyIDE2IGJpdHMKPiA+ID4gPiA+ID4gICAgICAgICAgICAgIGlkZW50aWZpZXMg
ZGV2aWNlIHR5cGUuIGUuZy4sIGZvciBwY2kgZGV2aWNlLCBpdCBpcwo+ID4gPiA+ID4gPiAgICAg
ICAgICAgICAgInBjaSB2ZW5kb3IgaWQiIHwgKFZGSU9fREVWSUNFX0ZMQUdTX1BDSSA8PCAxNiku
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gV2hhdCBwdXJwb3NlIGRvZXMgdGhpcyBzZXJ2ZT8gIElmIGl0
J3MgaW50ZW5kZWQgYXMgc29tZSBzb3J0IG9mCj4gPiA+ID4gPiBuYW1lc3BhY2UgZmVhdHVyZSwg
c2hvdWxkbid0IHdlIGZpcnN0IGFzc3VtZSB0aGF0IHdlIGNhbiBvbmx5IHN1cHBvcnQKPiA+ID4g
PiA+IG1pZ3JhdGlvbiB0byBkZXZpY2VzIG9mIHRoZSBzYW1lIHR5cGU/ICBUaGVyZWZvcmUgZWFj
aCB0eXBlIHdvdWxkCj4gPiA+ID4gPiBhbHJlYWR5IGhhdmUgaXRzIG93biBuYW1lc3BhY2UuICBB
bHNvIHRoYXQgd291bGQgbWFrZSB0aGUgdHJhaWxpbmcgYml0Cj4gPiA+ID4gPiBvZiB0aGUgdmVy
c2lvbiBzdHJpbmcgbGlzdGVkIGJlbG93IGluIHRoZSBleGFtcGxlIHJlZHVuZGFudC4gIEEgdmVu
ZG9yCj4gPiA+ID4gPiBpcyBzdGlsbCB3ZWxjb21lIHRvIGluY2x1ZGUgdGhpcyBpbiB0aGVpciB2
ZXJzaW9uIHN0cmluZyBpZiB0aGV5IHdpc2gsCj4gPiA+ID4gPiBidXQgSSB0aGluayB0aGUgc3Ry
aW5nIHNob3VsZCBiZSBlbnRpcmVseSB2ZW5kb3IgZGVmaW5lZC4KPiA+ID4gPiA+Cj4gPiA+ID4g
aGkgQWxleCwKPiA+ID4gPiBUaGlzIGNvbW1vbiBwYXJ0IGlzIGEga2luZCBvZiBuYW1lc3BhY2Uu
Cj4gPiA+ID4gQmVjYXVzZSBpZiB2ZXJzaW9uIHN0cmluZyBpcyBlbnRpcmVseSBkZWZpbmVkIGJ5
IHZlbmRvcnMsIEknbSB3b3JyaWVkIGFib3V0Cj4gPiA+ID4gaWYgdGhlcmUgaXMgYSBjYXNlIHRo
YXQgb25lIHZlbmRvcidzIHZlcnNpb24gc3RyaW5nIGhhcHBlbnMgdG8gZGVjZWl2ZSBhbmQKPiA+
ID4gPiBpbnRlcmZlcmUgd2l0aCBhbm90aGVyIHZlbmRvcidzIHZlcnNpb24gY2hlY2tpbmc/Cj4g
PiA+ID4gZS5nLgo+ID4gPiA+IHZlbmRvciBBIGhhcyBhIHZlcnNpb24gc3RyaW5nIGxpa2U6IHZl
bmRvciBpZCArIGRldmljZSBpZCArIG1kZXYgdHlwZQo+ID4gPiA+IHZlbmRvciBCIGhhcyBhIHZl
cnNpb24gc3RyaW5nIGxpa2U6IGRldmljZSBpZCArIHZlbmRvciBpZCArIG1kZXYgdHlwZQo+ID4g
PiA+IGJ1dCB2ZW5kb3IgQSdzIHZlbmRvciBpZCBpcyAweDgwODYsIGRldmljZSBpZCBpcyAweDEy
MTcKPiA+ID4gPiB2ZW5kb3IgQidzIHZlbmRvciBpZCBpcyAweDEyMTcsIGRldmljZSBpZCBpcyAw
eDgwODYuCj4gPiA+ID4KPiA+ID4gPiBJbiB0aGlzIGNvcm5lciBjYXNlLCB0aGUgdHdvIHZlbmRv
cnMgbWF5IHJlZ2FyZCB0aGUgdHdvIGRldmljZSBpcwo+ID4gPiA+IG1pZ3JhdGFibGUgYnV0IGFj
dHVhbGx5IHRoZXkgYXJlIG5vdC4KPiA+ID4gPgo+ID4gPiA+IFRoYXQncyB0aGUgcmVhc29uIGZv
ciB0aGlzIGNvbW1vbiBwYXJ0IHRoYXQgc2VydmUgYXMgYSBraW5kIG9mIG5hbWVzcGFjZQo+ID4g
PiA+IHRoYXQgYWxsIHZlbmRvcnMgd2lsbCBjb21wbHkgd2l0aCB0byBhdm9pZCBvdmVybGFwLgo+
ID4gPgo+ID4gPiBJZiB3ZSBhc3N1bWUgdGhhdCBtaWdyYXRpb24gY2FuIG9ubHkgb2NjdXIgYmV0
d2VlbiBtYXRjaGluZyBtZGV2IHR5cGVzLAo+ID4gPiB0aGlzIGlzIHJlZHVuZGFudCwgZWFjaCB0
eXBlIGFscmVhZHkgaGFzIHRoZWlyIG93biBuYW1lc3BhY2UuCj4gPiA+Cj4gPiBoaSBBbGV4LAo+
ID4gZG8geW91IG1lYW4gdXNlciBzcGFjZSBzb2Z0d2FyZSBsaWtlIGxpYnZpcnQgbmVlZHMgdG8g
Zmlyc3QgY2hlY2sgd2hldGhlcgo+ID4gbWRldiB0eXBlIGlzIG1hdGNoaW5nIGFuZCB0aGVuIGNo
ZWNrIHdoZXRoZXIgdmVyc2lvbiBpcyBtYXRjaGluZz8KPiAKPiBJIHdvdWxkIGV4cGVjdCB0aGF0
IGxpYnZpcnQgKG9yIG90aGVyIG1nbXQgYXBwcykgd2lsbCBhbHdheXMgZmlyc3QKPiBjaGVjayB0
aGF0IHRoZSB2ZW5kb3IgaWQsIGRldmljZSBpZCwgbWRldiB0eXBlIGFsbCBtYXRjaC4gU28gZm9y
IHRoZQo+IHZlcnNpb24gc3RyaW5nIGl0IHNob3VsZCBzdWZmaWNlIHRvIGJlIGEgIm5vcm1hbCIg
bnVtZXJpYyB2YWx1ZS4KPiAKPiBFc3NlbnRpYWxseSB2ZXJzaW9uIHN0cmluZyBqdXN0IG5lZWRz
IHRvIGJlIHRoZXJlIHRvIGRpc3Rpbmd1aXNoCj4gcmV2aXNpb25zIG9mIHRoZSBzYW1lIG1kZXYg
dHlwZSBvdmVyIHRpbWUuCj4KaGkgRGFuaWVsLApUaGUgd2F5IHRoYXQgdXNlciBzcGFjZSBzb2Z0
d2FyZSBjaGVja3MgdGhhdCB0aGUgdmVuZG9yIGlkLCBkZXZpY2UgaWQsIG1kZXYKdHlwZSBhbGwg
bWF0Y2ggYW5kIHZlcnNpb24gc3RyaW5nIGlzIGp1c3QgcmV2aXNpb25zIGlzIHNvbWV3aGF0IHJl
c3RyaWN0aXZlPwp1c2VyIHNwYWNlIHNvZnR3YXJlIGNvdWxkIG5vdCBoYXZlIHNvIG11Y2ggZGV0
YWlsZWQgaW5mb3JtYXRpb24gcmVnYXJkaW5nIHRvCndoaWNoIGRldmljZXMgYXJlIGNvbXBhdGli
bGUsIGVzcGVjaWFsbHkgd2hlbiB2ZW5kb3IgaWQsIGRldmljZSBpZCwKcmV2aXNpb24gaWQsIGFu
ZCBtZGV2IHR5cGVzIGFyZSBub3QgZW5vdWdoIG9yIG5vIG5lZWQgdG8gYmUgZXhhY3RseSB0aGUg
c2FtZS4KQnkgbW92aW5nIGRlY2lzaW9uIG1ha2luZyBmb3IgY29tcGF0aWJpbGl0eSBmcm9tIHVz
ZXIgc3BhY2UgdG8gdmVuZG9yCmRyaXZlciwgdXNlciBzcGFjZSBzb2Z0d2FyZSBjYW4gYmUgbW9y
ZSBjaGFuZ2UtcmVzaXN0YW50LgpBZ3JlZT8KClRoYW5rcwpZYW4KCj4gCj4gUmVnYXJkcywKPiBE
YW5pZWwKPiAtLQo+IHw6IGh0dHBzOi8vYmVycmFuZ2UuY29tICAgICAgLW8tICAgIGh0dHBzOi8v
d3d3LmZsaWNrci5jb20vcGhvdG9zL2RiZXJyYW5nZSA6fAo+IHw6IGh0dHBzOi8vbGlidmlydC5v
cmcgICAgICAgICAtby0gICAgICAgICAgICBodHRwczovL2ZzdG9wMTM4LmJlcnJhbmdlLmNvbSA6
fAo+IHw6IGh0dHBzOi8vZW50YW5nbGUtcGhvdG8ub3JnICAgIC1vLSAgICBodHRwczovL3d3dy5p
bnN0YWdyYW0uY29tL2RiZXJyYW5nZSA6fApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=

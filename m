Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp82645ywo;
        Mon, 1 Apr 2019 01:14:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzat5E5aPDhIgVBr3ffY6t5TNuih29D80UUT8ww/ud/iUHDycon2DvXyJXfWjqJz19G/B+j
X-Received: by 2002:a17:902:7793:: with SMTP id o19mr10416411pll.275.1554106488579;
        Mon, 01 Apr 2019 01:14:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554106488; cv=none;
        d=google.com; s=arc-20160816;
        b=w0tcNd1XxjbMKz9nk59JgQ4uYGw4LeU+ctmQW2IHi0B7AvjZydDCW7NyWOE8LFnfFa
         BdVRONom0af9MuzPJJLHU6oZ+AvcxWK88Ws4jjX+sOY+FmzhmnYDEUDnjfdVrLsyOAaZ
         Nsyx1FdrjzJh+8sOo1BTflRyxldj9FzbcEdsTInSnb/MkDEoosxajbVwDKyFtBfdy8cp
         8Et8Q9eHg6gJAQJNWNr4ZNJaMWtgLfG1B8N1vhtTTDIcPZetVxDAoKKtCqttrIrlwHRk
         QBf9Z1uztRRCH0FWzLZLhD4xc5ID7fHayb8TrZYG3EyW9NibegC2fzp/8O+x3SNzyBRe
         NlhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:organization:references:in-reply-to
         :message-id:subject:to:from:date:delivered-to;
        bh=WioeO2SNK89etV0v15+KWm5xdEDMQexE3+KPVh6X6w4=;
        b=km3fmRYRcOO4lzD3BnEJrMZ+16FrNZ3G9GjROdWUI3sAoil54Xzyhc42t0fnW69tDI
         6WrZBQ24qqBePMS/Jde/lO/Gg4fO6a7+kY0HckfmhPZCjCr6eX127HcJf3draW7O17TN
         ScwPgyL3297er4/peFqMnZCh+/pnadfEgUYosknjV0tK4VOEDRsBYb5W8F1T7/cxNXIz
         fPfBNmQ7Bji9QRTXwBR+LXvulZlBHT0LgB3ncCTZuGs28bOMg9bC0QnUEDHf3IBVsUEj
         B0YLdrLWe+RP76fRRYgN3zM+VyPw7qHbl4+6DZv8uiQbMW1EOcMPdxfwPN2eAaDusqZR
         PouA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id t4si3921014plz.387.2019.04.01.01.14.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Apr 2019 01:14:48 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0DE6E5CF;
	Mon,  1 Apr 2019 08:14:48 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8F96E5CF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  1 Apr 2019 08:14:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7AA8187628;
 Mon,  1 Apr 2019 08:14:46 +0000 (UTC)
Received: from gondolin (ovpn-117-29.ams2.redhat.com [10.36.117.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8272B5D9D4;
 Mon,  1 Apr 2019 08:14:33 +0000 (UTC)
Date: Mon, 1 Apr 2019 10:14:30 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190401101430.72d2ef9e.cohuck@redhat.com>
In-Reply-To: <20190327161020.1c013e65@x1.home>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190219113212.GC2941@work-vm>
 <20190220052838.GC16456@joy-OptiPlex-7040>
 <20190220110142.GD2608@work-vm>
 <33183CC9F5247A488A2544077AF19020DB25D30F@dggeml511-mbx.china.huawei.com>
 <20190220124242.5a1685c5.cohuck@redhat.com>
 <20190327063509.GD14681@joy-OptiPlex-7040>
 <20190327201854.GG2636@work-vm> <20190327161020.1c013e65@x1.home>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 01 Apr 2019 08:14:46 +0000 (UTC)
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
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi
 L" <yi.l.liu@intel.com>, "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, Zhao Yan <yan.y.zhao@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCAyNyBNYXIgMjAxOSAxNjoxMDoyMCAtMDYwMApBbGV4IFdpbGxpYW1zb24gPGFsZXgu
d2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToKCj4gT24gV2VkLCAyNyBNYXIgMjAxOSAyMDox
ODo1NCArMDAwMAo+ICJEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IiA8ZGdpbGJlcnRAcmVkaGF0LmNv
bT4gd3JvdGU6Cj4gCj4gPiAqIFpoYW8gWWFuICh5YW4ueS56aGFvQGludGVsLmNvbSkgd3JvdGU6
ICAKPiA+ID4gT24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMDc6NDI6NDJQTSArMDgwMCwgQ29ybmVs
aWEgSHVjayB3cm90ZTogICAgCj4gPiA+ID4gPiA+ID4gPiAgIGIpIEhvdyBkbyB3ZSBkZXRlY3Qg
aWYgd2UncmUgbWlncmF0aW5nIGZyb20vdG8gdGhlIHdyb25nIGRldmljZSBvcgo+ID4gPiA+ID4g
PiA+ID4gdmVyc2lvbiBvZiBkZXZpY2U/ICBPciBzYXkgdG8gYSBkZXZpY2Ugd2l0aCBvbGRlciBm
aXJtd2FyZSBvciBwZXJoYXBzCj4gPiA+ID4gPiA+ID4gPiBhIGRldmljZSB0aGF0IGhhcyBsZXNz
IGRldmljZSBtZW1vcnkgPyAgICAgIAo+ID4gPiA+ID4gPiA+IEFjdHVhbGx5IGl0J3Mgc3RpbGwg
YW4gb3BlbiBmb3IgVkZJTyBtaWdyYXRpb24uIE5lZWQgdG8gdGhpbmsgYWJvdXQKPiA+ID4gPiA+
ID4gPiB3aGV0aGVyIGl0J3MgYmV0dGVyIHRvIGNoZWNrIHRoYXQgaW4gbGlidmlydCBvciBxZW11
IChsaWtlIGEgZGV2aWNlIG1hZ2ljCj4gPiA+ID4gPiA+ID4gYWxvbmcgd2l0aCB2ZXJpb24gPyku
ICAgICAgCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFdlIG11c3Qga2VlcCB0aGUgaGFyZHdhcmUgZ2Vu
ZXJhdGlvbiBpcyB0aGUgc2FtZSB3aXRoIG9uZSBQT0Qgb2YgcHVibGljIGNsb3VkCj4gPiA+ID4g
PiBwcm92aWRlcnMuIEJ1dCB3ZSBzdGlsbCB0aGluayBhYm91dCB0aGUgbGl2ZSBtaWdyYXRpb24g
YmV0d2VlbiBmcm9tIHRoZSB0aGUgbG93ZXIKPiA+ID4gPiA+IGdlbmVyYXRpb24gb2YgaGFyZHdh
cmUgbWlncmF0ZWQgdG8gdGhlIGhpZ2hlciBnZW5lcmF0aW9uLiAgICAKPiA+ID4gPiAKPiA+ID4g
PiBBZ3JlZWQsIGxvd2VyLT5oaWdoZXIgaXMgdGhlIG9uZSBkaXJlY3Rpb24gdGhhdCBtaWdodCBt
YWtlIHNlbnNlIHRvCj4gPiA+ID4gc3VwcG9ydC4KPiA+ID4gPiAKPiA+ID4gPiBCdXQgcmVnYXJk
bGVzcyBvZiB0aGF0LCBJIHRoaW5rIHdlIG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgaW5jb21wYXRp
YmxlCj4gPiA+ID4gZGV2aWNlcy92ZXJzaW9ucyBmYWlsIGRpcmVjdGx5IGluc3RlYWQgb2YgZmFp
bGluZyBpbiBhIHN1YnRsZSwgaGFyZCB0bwo+ID4gPiA+IGRlYnVnIHdheS4gTWlnaHQgYmUgdXNl
ZnVsIHRvIGRvIHNvbWUgaW5pdGlhbCBzYW5pdHkgY2hlY2tzIGluIGxpYnZpcnQKPiA+ID4gPiBh
cyB3ZWxsLgo+ID4gPiA+IAo+ID4gPiA+IEhvdyBlYXN5IGlzIGl0IHRvIG9idGFpbiB0aGF0IGlu
Zm9ybWF0aW9uIGluIGEgZm9ybSB0aGF0IGNhbiBiZQo+ID4gPiA+IGNvbnN1bWVkIGJ5IGhpZ2hl
ciBsYXllcnM/IENhbiB3ZSBmaW5kIG91dCB0aGUgZGV2aWNlIHR5cGUgYXQgbGVhc3Q/Cj4gPiA+
ID4gV2hhdCBhYm91dCBzb21lIGtpbmQgb2YgcmV2aXNpb24/ICAgIAo+ID4gPiBoaSBBbGV4IGFu
ZCBDb3JuZWxpYQo+ID4gPiBmb3IgZGV2aWNlIGNvbXBhdGliaWxpdHksIGRvIHlvdSB0aGluayBp
dCdzIGEgZ29vZCBpZGVhIHRvIHVzZSAidmVyc2lvbiIKPiA+ID4gYW5kICJkZXZpY2UgdmVyc2lv
biIgZmllbGRzPwo+ID4gPiAKPiA+ID4gdmVyc2lvbiBmaWVsZDogaWRlbnRpZnkgbGl2ZSBtaWdy
YXRpb24gaW50ZXJmYWNlJ3MgdmVyc2lvbi4gaXQgY2FuIGhhdmUgYQo+ID4gPiBzb3J0IG9mIGJh
Y2t3YXJkIGNvbXBhdGliaWxpdHksIGxpa2UgdGFyZ2V0IG1hY2hpbmUncyB2ZXJzaW9uID49IHNv
dXJjZQo+ID4gPiBtYWNoaW5lJ3MgdmVyc2lvbi4gc29tZXRoaW5nIGxpa2UgdGhhdC4gIAo+IAo+
IERvbid0IHdlIGVzc2VudGlhbGx5IGFscmVhZHkgaGF2ZSB0aGlzIHZpYSB0aGUgZGV2aWNlIHNw
ZWNpZmljIHJlZ2lvbj8KPiBUaGUgc3RydWN0IHZmaW9faW5mb19jYXBfaGVhZGVyIGluY2x1ZGVz
IGlkIGFuZCB2ZXJzaW9uIGZpZWxkcywgc28gd2UKPiBjYW4gZGVjbGFyZSBhIG1pZ3JhdGlvbiBp
ZCBhbmQgaW5jcmVtZW50IHRoZSB2ZXJzaW9uIGZvciBhbnkKPiBpbmNvbXBhdGlibGUgY2hhbmdl
cyB0byB0aGUgcHJvdG9jb2wuCj4gCj4gPiA+IAo+ID4gPiBkZXZpY2VfdmVyc2lvbiBmaWVsZCBj
b25zaXN0cyB0d28gcGFydHM6Cj4gPiA+IDEuIHZlbmRvciBpZCA6IGl0IHRha2VzIDMyIGJpdHMu
IGUuZy4gMHg4MDg2LiAgCj4gCj4gV2hvIGFsbG9jYXRlcyBJRHM/ICBJZiB3ZSdyZSBnb2luZyB0
byB1c2UgUENJIHZlbmRvciBJRHMsIHRoZW4gSSdkCj4gc3VnZ2VzdCB3ZSB1c2UgYSBiaXQgdG8g
ZmxhZyBpdCBhcyBzdWNoIHNvIHdlIGNhbiByZXNlcnZlIHRoYXQgcG9ydGlvbgo+IG9mIHRoZSAz
MmJpdCBhZGRyZXNzIHNwYWNlLiAgU2VlIGZvciBleGFtcGxlOgo+IAo+ICNkZWZpbmUgVkZJT19S
RUdJT05fVFlQRV9QQ0lfVkVORE9SX1RZUEUgICAgICAgICgxIDw8IDMxKQo+ICNkZWZpbmUgVkZJ
T19SRUdJT05fVFlQRV9QQ0lfVkVORE9SX01BU0sgICAgICAgICgweGZmZmYpCj4gCj4gRm9yIHZl
bmRvciBzcGVjaWZpYyByZWdpb25zLgoKSnVzdCBicm93c2luZyB0aHJvdWdoIHRoZSB0aHJlYWQu
Li4gaWYgSSBkb24ndCBtaXN1bmRlcnN0YW5kLCB3ZSBjb3VsZAp1c2UgYSB2ZmlvLWNjdyByZWdp
b24gdHlwZSBpZCBoZXJlIGZvciBjY3csIGNvdWxkbid0IHdlPyBKdXN0IHRvIG1ha2UKc3VyZSB0
aGF0IHRoaXMgaXMgbm90IHBjaS1zcGVjaWZpYy4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

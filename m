Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp8185822ywe;
        Fri, 8 Mar 2019 08:11:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqwapHBVwSJNFZn3rtAdVNdCxsT3VTHB9q8h/w0Ipktb2uFsupQNAGLkz3ABrd9KMRODYtkB
X-Received: by 2002:a63:1960:: with SMTP id 32mr17288926pgz.171.1552061501028;
        Fri, 08 Mar 2019 08:11:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552061501; cv=none;
        d=google.com; s=arc-20160816;
        b=bT1gEQ7OFVgAqd+2dtC1KHmpmD860ptsy6/TdYbNZDp/Dd5YB6N1wtHPTCMzG86vdB
         cNIyyYJ8hJiXOByWoodf8sefZBg4OWHTvlHKuFsU/1Gviuo1k2xk1U3uvTmXeU/kcEIX
         afzUlkxzoeGcgsj8eH2jzvd0kRyAge8qfUs8F1Cqg5xkVAfZGFD6GL58t59GH6z7azVf
         IASf65R6zBVFHo3TN+GxiDRZT7AFeb7xPNgzRFZGK+EmCd8YJHPEjjyRzEOAKnxyoXOl
         D5OxqNzrupjuP+rjFC31jI7zou8Y7kixc8txVLG0ZNfaU1PFnVuyP7cxrNdUEK6qvSZQ
         RUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:organization:references:in-reply-to
         :message-id:subject:to:from:date:delivered-to;
        bh=c1juhE5CoXS1KF/Uy7HQ12XTQtsDop8CtV2FxlFcByw=;
        b=DTwEvh8RctCTC2pV3CQN7VzEK9WxwoVOxntjbIxqT4QxQ4OAfL4AmrXN7QRwWF2gJy
         q8mdOEiCnV06qkYNE0KsV2qR7HzOqldgdP6BS+RzPiJsiO78aljrYmJHTfsJSSm1iI6/
         1moE23JJ07asN5rz4lvCpEdG4Q+w3bp2DDuf0TEYAujD+wMry0h3U/Ua21is97HRjxEF
         ZFlqU6yxJUkEUWseMy0zbbQhhYoJNypR5G11FKFdJPxi+bhpMP7BlDscGZYnVJy0L7uq
         KFkcd+mHObGDcxH2ilD+ztmvASVKxvEsNAepnAfrYF9NlmQ4U2CVXDzPkUAj6HbPrpRH
         McRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id a24si6679668pgw.581.2019.03.08.08.11.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2019 08:11:41 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9126E3D4;
	Fri,  8 Mar 2019 16:11:40 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364B26E3D4
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 Mar 2019 16:11:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5950530718D9;
 Fri,  8 Mar 2019 16:11:38 +0000 (UTC)
Received: from x1.home (ovpn-116-24.phx2.redhat.com [10.3.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4DC460142;
 Fri,  8 Mar 2019 16:11:34 +0000 (UTC)
Date: Fri, 8 Mar 2019 09:11:33 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190308091133.3073f5db@x1.home>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19C97CA6B@SHSMSX104.ccr.corp.intel.com>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190221134051.2c28893e@w520.home>
 <20190225022255.GP16456@joy-OptiPlex-7040>
 <20190307104421.534ea56f@w520.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19C97CA6B@SHSMSX104.ccr.corp.intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 08 Mar 2019 16:11:38 +0000 (UTC)
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
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gVGh1LCA3IE1hciAyMDE5IDIzOjIwOjM2ICswMDAwCiJUaWFuLCBLZXZpbiIgPGtldmluLnRp
YW5AaW50ZWwuY29tPiB3cm90ZToKCj4gPiBGcm9tOiBBbGV4IFdpbGxpYW1zb24gW21haWx0bzph
bGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbV0KPiA+IFNlbnQ6IEZyaWRheSwgTWFyY2ggOCwgMjAx
OSAxOjQ0IEFNICAKPiA+ID4gPiAgCj4gPiA+ID4gPiAgICAgICAgIFRoaXMga2luZCBvZiBkYXRh
IG5lZWRzIHRvIGJlIHNhdmVkIC8gbG9hZGVkIGluIHByZS1jb3B5IGFuZAo+ID4gPiA+ID4gICAg
ICAgICBzdG9wLWFuZC1jb3B5IHBoYXNlLgo+ID4gPiA+ID4gICAgICAgICBUaGUgZGF0YSBvZiBk
ZXZpY2UgbWVtb3J5IGlzIGhlbGQgaW4gZGV2aWNlIG1lbW9yeSByZWdpb24uCj4gPiA+ID4gPiAg
ICAgICAgIFNpemUgb2YgZGV2aWUgbWVtb3J5IGlzIHVzdWFsbHkgbGFyZ2VyIHRoYW4gdGhhdCBv
ZiBkZXZpY2UKPiA+ID4gPiA+ICAgICAgICAgbWVtb3J5IHJlZ2lvbi4gcWVtdSBuZWVkcyB0byBz
YXZlL2xvYWQgaXQgaW4gY2h1bmtzIG9mIHNpemUgb2YKPiA+ID4gPiA+ICAgICAgICAgZGV2aWNl
IG1lbW9yeSByZWdpb24uCj4gPiA+ID4gPiAgICAgICAgIE5vdCBhbGwgZGV2aWNlIGhhcyBkZXZp
Y2UgbWVtb3J5LiBMaWtlIElHRCBvbmx5IHVzZXMgc3lzdGVtICAKPiA+IG1lbW9yeS4gIAo+ID4g
PiA+Cj4gPiA+ID4gSXQgc2VlbXMgYSBsaXR0bGUgZ3JhdHVpdG91cyB0byBtZSB0aGF0IHRoaXMg
aXMgYSBzZXBhcmF0ZSByZWdpb24gb3IKPiA+ID4gPiB0aGF0IHRoaXMgZGF0YSBpcyBoYW5kbGVk
IHNlcGFyYXRlbHkuICBBbGwgb2YgdGhpcyBkYXRhIGlzIG9wYXF1ZSB0bwo+ID4gPiA+IFFFTVUs
IHNvIHdoeSBkbyB3ZSBuZWVkIHRvIHNlcGFyYXRlIGl0PyAgCj4gPiA+IGhpIEFsZXgsCj4gPiA+
IGFzIHRoZSBkZXZpY2Ugc3RhdGUgaW50ZXJmYWNlcyBhcmUgcHJvdmlkZWQgYnkga2VybmVsLCBp
dCBpcyBleHBlY3RlZCB0bwo+ID4gPiBtZWV0IGFzIGdlbmVyYWwgbmVlZHMgYXMgcG9zc2libGUu
IFNvLCBkbyB5b3UgdGhpbmsgdGhlcmUgYXJlIHN1Y2ggdXNlCj4gPiA+IGNhc2VzIGZyb20gdXNl
ciBzcGFjZSB0aGF0IHVzZXIgc3BhY2Uga25vd3Mgd2VsbCBvZiB0aGUgZGV2aWNlLCBhbmQKPiA+
ID4gaXQgd2FudHMga2VybmVsIHRvIHJldHVybiBkZXNpcmVkIGRhdGEgYmFjayB0byBpdC4KPiA+
ID4gRS5nLiBJdCBqdXN0IHdhbnRzIHRvIGdldCB3aG9sZSBkZXZpY2UgY29uZmlnIGRhdGEgaW5j
bHVkaW5nIGFsbCBtbWlvcywKPiA+ID4gcGFnZSB0YWJsZXMsIHBjaSBjb25maWcgZGF0YS4uLgo+
ID4gPiBvciwgSXQganVzdCB3YW50cyB0byBnZXQgY3VycmVudCBkZXZpY2UgbWVtb3J5IHNuYXBz
aG90LCBub3QgaW5jbHVkaW5nIGFueQo+ID4gPiBkaXJ0eSBkYXRhLgo+ID4gPiBPciwgSXQganVz
dCBuZWVkcyB0aGUgZGlydHkgcGFnZXMgaW4gZGV2aWNlIG1lbW9yeSBvciBzeXN0ZW0gbWVtb3J5
Lgo+ID4gPiBXaXRoIGFsbCB0aGlzIGFjY3VyYXRlIHF1ZXJ5LCBxdWl0ZSBhIGxvdCBvZiB1c2Vm
dWwgZmVhdHVyZXMgY2FuIGJlCj4gPiA+IGRldmVsb3BwZWQgaW4gdXNlciBzcGFjZS4KPiA+ID4K
PiA+ID4gSWYgYWxsIG9mIHRoaXMgZGF0YSBpcyBvcGFxdWUgdG8gdXNlciBhcHAsIHNlZW1zIHRo
ZSBvbmx5IHVzZSBjYXNlIGlzCj4gPiA+IGZvciBsaXZlIG1pZ3JhdGlvbi4gIAo+ID4gCj4gPiBJ
IGNhbiBjZXJ0YWlubHkgYXBwcmVjaWF0ZSBhIG1vcmUgdmVyc2F0aWxlIGludGVyZmFjZSwgYnV0
IEkgdGhpbmsKPiA+IHdlJ3JlIGFsc28gdHJ5aW5nIHRvIGNyZWF0ZSB0aGUgbW9zdCBzaW1wbGUg
aW50ZXJmYWNlIHdlIGNhbiwgd2l0aCB0aGUKPiA+IHByaW1hcnkgdGFyZ2V0IGJlaW5nIGxpdmUg
bWlncmF0aW9uLiAgQXMgc29vbiBhcyB3ZSBzdGFydCBkZWZpbmluZyB0aGlzCj4gPiB0eXBlIG9m
IGRldmljZSBtZW1vcnkgYW5kIHRoYXQgdHlwZSBvZiBkZXZpY2UgbWVtb3J5LCB3ZSdyZSBnb2lu
ZyB0bwo+ID4gaGF2ZSBhbm90aGVyIGRldmljZSBjb21lIGFsb25nIHRoYXQgbmVlZHMgeWV0IGFu
b3RoZXIgYmVjYXVzZSB0aGV5IGhhdmUKPiA+IGEgc2xpZ2h0bHkgZGlmZmVyZW50IHJlcXVpcmVt
ZW50LiAgRXZlbiB3aXRob3V0IHRoYXQsIHdlJ3JlIGdvaW5nIHRvCj4gPiBoYXZlIHZlbmRvciBk
cml2ZXJzIGltcGxlbWVudCBpdCBkaWZmZXJlbnRseSwgc28gd2hhdCB3b3JrcyBmb3Igb25lCj4g
PiBkZXZpY2UgZm9yIGEgbW9yZSB0YXJnZXRlZCBhcHByb2FjaCBtYXkgbm90IHdvcmsgZm9yIGFs
bCBkZXZpY2VzLiAgQ2FuCj4gPiB5b3UgZW51bWVyYXRlIHNvbWUgc3BlY2lmaWMgZXhhbXBsZXMg
b2YgdGhlIHVzZSBjYXNlcyB5b3UgaW1hZ2luZSB5b3VyCj4gPiBkZXNpZ24gdG8gZW5hYmxlPwo+
ID4gICAKPiAKPiBEbyB3ZSB3YW50IHRvIGNvbnNpZGVyIGFuIHVzZSBjYXNlIHdoZXJlIHVzZXIg
c3BhY2Ugd291bGQgbGlrZSB0bwo+IHNlbGVjdGl2ZWx5IGludHJvc3BlY3QgYSBwb3J0aW9uIG9m
IHRoZSBkZXZpY2Ugc3RhdGUgKGluY2x1ZGluZyBpbXBsaWNpdCAKPiBzdGF0ZSB3aGljaCBhcmUg
bm90IGF2YWlsYWJsZSB0aHJvdWdoIFBDSSByZWdpb25zKSwgYW5kIG1heSBhc2sgZm9yCj4gY2Fw
YWJpbGl0eSBvZiBkaXJlY3QgbWFwcGluZyBvZiBzZWxlY3RlZCBwb3J0aW9uIGZvciBzY2Fubmlu
ZyAoZS5nLgo+IGRldmljZSBtZW1vcnkpIGluc3RlYWQgb2YgYWx3YXlzIHR1cm5pbmcgb24gZGly
dHkgbG9nZ2luZyBvbiBhbGwKPiBkZXZpY2Ugc3RhdGU/CgpJIGRvbid0IHNlZSB0aGF0IGEgbWln
cmF0aW9uIGludGVyZmFjZSBuZWNlc3NhcmlseSBsZW5kcyBpdHNlbGYgdG8gdGhpcwp1c2UgY2Fz
ZS4gIEEgbWlncmF0aW9uIGRhdGEgc3RyZWFtIGhhcyBubyByZXF1aXJlbWVudCB0byBiZSB1c2Vy
CmNvbnN1bWFibGUgYXMgYW55dGhpbmcgb3RoZXIgdGhhbiBvcGFxdWUgZGF0YSwgdGhlcmUncyBh
bHNvIG5vCnJlcXVpcmVtZW50IHRoYXQgaXQgZXhwb3NlIHN0YXRlIGluIGEgZm9ybSB0aGF0IGRp
cmVjdGx5IHJlcHJlc2VudHMgdGhlCmludGVybmFsIHN0YXRlIG9mIHRoZSBkZXZpY2UuICBJbiBm
YWN0IEknbSBub3Qgc3VyZSB3ZSB3YW50IHRvIGVuY291cmFnZQppbnRyb3NwZWN0aW9uIHZpYSB0
aGlzIGRhdGEgc3RyZWFtLiAgSWYgYSB1c2VyIGtub3dzIGhvdyB0byBpbnRlcnByZXQKdGhlIGRh
dGEsIHdoYXQgcHJldmVudHMgdGhlbSBmcm9tIG1vZGlmeWluZyB0aGUgZGF0YSBpbi1mbGlnaHQ/
ICBJJ3ZlCnJhaXNlZCB0aGUgcXVlc3Rpb24gcHJldmlvdXNseSByZWdhcmRpbmcgaG93IHRoZSB2
ZW5kb3IgZHJpdmVyIGNhbgp2YWxpZGF0ZSB0aGUgaW50ZWdyaXR5IG9mIHRoZSBtaWdyYXRpb24g
ZGF0YSBzdHJlYW0uICBVc2luZyB0aGUKbWlncmF0aW9uIGludGVyZmFjZSB0byBpbnRyb3NwZWN0
IHRoZSBkZXZpY2UgY2VydGFpbmx5IHN1Z2dlc3RzIGFuCmludGVyZmFjZSByaXBlIGZvciBleHBs
b2l0aW5nIGFueSBwb3RlbnRpYWwgd2Vha25lc3MgaW4gdGhlIHZlbmRvcgpkcml2ZXIgcmVhc3Nl
bWJsaW5nIHRoYXQgbWlncmF0aW9uIHN0cmVhbS4gIElmIHRoZSB1c2VyIGhhcyBhbiBtbWFwIHRv
CnRoZSBhY3R1YWwgbGl2ZSB3b3JraW5nIHN0YXRlIG9mIHRoZSB2ZW5kb3IgZHJpdmVyLCBwcm90
ZWN0aW9uIGluIHRoZQpoYXJkd2FyZSBzZWVtcyBsaWtlIHRoZSBvbmx5IHdheSB5b3UgY291bGQg
cHJvdGVjdCBhZ2FpbnN0IGEgbWFsaWNpb3VzCnVzZXIuICBQbGVhc2UgYmUgZGVmZW5zaXZlIGlu
IHdoYXQgaXMgZGlyZWN0bHkgZXhwb3NlZCB0byB0aGUgdXNlciBhbmQKd2hhdCBzYWZlZ3VhcmRz
IGFyZSBpbiBwbGFjZSB3aXRoaW4gdGhlIHZlbmRvciBkcml2ZXIgZm9yIHZhbGlkYXRpbmcKaW5j
b21pbmcgZGF0YS4gIFRoYW5rcywKCkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

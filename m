Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp8501294ywe;
        Fri, 8 Mar 2019 14:03:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqxyxWWcin1HvLvAz7vULibIW/C8jjztzuew1WCz3fplfFvDZFhcRzE3HEF9R77bPiALZEbh
X-Received: by 2002:a17:902:8697:: with SMTP id g23mr21466608plo.30.1552082580269;
        Fri, 08 Mar 2019 14:03:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552082580; cv=none;
        d=google.com; s=arc-20160816;
        b=o0/85BBuc0qAuSvE7ICvqhmeBNh3tmgE7OjzI+EZbqee/+IB6CONApcggIp5CKT+cl
         p2go4AfQbKQkJEUf7eKo5GyFcttLcUaA13okDMSsTZwr3a4mzWEUfMSAk8f4IHyASHF2
         hAgylLc7/Ks5yaQJ1yWzM+dxFrHnI1aBQtagQ2FfeA/v/T5C7JDB/jDRqNqK1i8Qtu6N
         q4OHcP/lQeorVJXKOCb671J0b45TlgUVsatHFoeFYVuwMZkwnk0rSbuALz3nffYny0f2
         3gFG9QZnA1E6Jpub3Pbn7g2flMfOxf3NmOzsYrMTfizfIk2RQ29yKzga/Mbt2dDcuApA
         MCNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:organization:references:in-reply-to
         :message-id:subject:to:from:date:delivered-to;
        bh=xtQYzmhlizJ+AcwMOLsqLRsqkyxKupA59hsKbt6n/HQ=;
        b=egr7pG3vLr6H3kX6FGP/nW04zZfiRI2qRUGIiI0T7voap81obmxHqCqHjn2xmL101c
         f+UnKB7L8KKLXzbTGXo8Cvxa20wWBdLQiEdc/nBXAGTA55jhXyuXGgYJtWOAjxjaxYWn
         SKHaXzmK8Na9StyiYVDtsef4BcAgVyF2PVoABgSyixj5g/LLHrazXgByArCxMzIH7FQs
         1yudVgXLaik52+kmUtQ+Ql9n//5HPc99qtR3VY/VE6k4L5MT5teaWGg0wqcNqzMSDczM
         08vDCCc4JuvEPIAuo4Z2QBuXkVZuvjCvRg6ISW0PVVys7TS6+z7RS/mfZxg5KHotAb5e
         iWkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id s194si2887324pgs.47.2019.03.08.14.02.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2019 14:03:00 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FFD6E425;
	Fri,  8 Mar 2019 22:02:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC456E3F7
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 Mar 2019 22:02:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C1F9D307D77A;
 Fri,  8 Mar 2019 22:02:57 +0000 (UTC)
Received: from x1.home (ovpn-116-24.phx2.redhat.com [10.3.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25BC65C1A1;
 Fri,  8 Mar 2019 22:02:55 +0000 (UTC)
Date: Fri, 8 Mar 2019 15:02:54 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190308150254.3d1af7d8@x1.home>
In-Reply-To: <20190308162146.GD2834@work-vm>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190221134051.2c28893e@w520.home>
 <20190225022255.GP16456@joy-OptiPlex-7040>
 <20190307104421.534ea56f@w520.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19C97CA6B@SHSMSX104.ccr.corp.intel.com>
 <20190308091133.3073f5db@x1.home> <20190308162146.GD2834@work-vm>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 08 Mar 2019 22:02:57 +0000 (UTC)
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
 "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "Wang, Zhi
 A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCA4IE1hciAyMDE5IDE2OjIxOjQ2ICswMDAwCiJEci4gRGF2aWQgQWxhbiBHaWxiZXJ0
IiA8ZGdpbGJlcnRAcmVkaGF0LmNvbT4gd3JvdGU6Cgo+ICogQWxleCBXaWxsaWFtc29uIChhbGV4
LndpbGxpYW1zb25AcmVkaGF0LmNvbSkgd3JvdGU6Cj4gPiBPbiBUaHUsIDcgTWFyIDIwMTkgMjM6
MjA6MzYgKzAwMDAKPiA+ICJUaWFuLCBLZXZpbiIgPGtldmluLnRpYW5AaW50ZWwuY29tPiB3cm90
ZToKPiA+ICAgCj4gPiA+ID4gRnJvbTogQWxleCBXaWxsaWFtc29uIFttYWlsdG86YWxleC53aWxs
aWFtc29uQHJlZGhhdC5jb21dCj4gPiA+ID4gU2VudDogRnJpZGF5LCBNYXJjaCA4LCAyMDE5IDE6
NDQgQU0gICAgCj4gPiA+ID4gPiA+ICAgIAo+ID4gPiA+ID4gPiA+ICAgICAgICAgVGhpcyBraW5k
IG9mIGRhdGEgbmVlZHMgdG8gYmUgc2F2ZWQgLyBsb2FkZWQgaW4gcHJlLWNvcHkgYW5kCj4gPiA+
ID4gPiA+ID4gICAgICAgICBzdG9wLWFuZC1jb3B5IHBoYXNlLgo+ID4gPiA+ID4gPiA+ICAgICAg
ICAgVGhlIGRhdGEgb2YgZGV2aWNlIG1lbW9yeSBpcyBoZWxkIGluIGRldmljZSBtZW1vcnkgcmVn
aW9uLgo+ID4gPiA+ID4gPiA+ICAgICAgICAgU2l6ZSBvZiBkZXZpZSBtZW1vcnkgaXMgdXN1YWxs
eSBsYXJnZXIgdGhhbiB0aGF0IG9mIGRldmljZQo+ID4gPiA+ID4gPiA+ICAgICAgICAgbWVtb3J5
IHJlZ2lvbi4gcWVtdSBuZWVkcyB0byBzYXZlL2xvYWQgaXQgaW4gY2h1bmtzIG9mIHNpemUgb2YK
PiA+ID4gPiA+ID4gPiAgICAgICAgIGRldmljZSBtZW1vcnkgcmVnaW9uLgo+ID4gPiA+ID4gPiA+
ICAgICAgICAgTm90IGFsbCBkZXZpY2UgaGFzIGRldmljZSBtZW1vcnkuIExpa2UgSUdEIG9ubHkg
dXNlcyBzeXN0ZW0gICAgCj4gPiA+ID4gbWVtb3J5LiAgICAKPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gSXQgc2VlbXMgYSBsaXR0bGUgZ3JhdHVpdG91cyB0byBtZSB0aGF0IHRoaXMgaXMgYSBzZXBh
cmF0ZSByZWdpb24gb3IKPiA+ID4gPiA+ID4gdGhhdCB0aGlzIGRhdGEgaXMgaGFuZGxlZCBzZXBh
cmF0ZWx5LiAgQWxsIG9mIHRoaXMgZGF0YSBpcyBvcGFxdWUgdG8KPiA+ID4gPiA+ID4gUUVNVSwg
c28gd2h5IGRvIHdlIG5lZWQgdG8gc2VwYXJhdGUgaXQ/ICAgIAo+ID4gPiA+ID4gaGkgQWxleCwK
PiA+ID4gPiA+IGFzIHRoZSBkZXZpY2Ugc3RhdGUgaW50ZXJmYWNlcyBhcmUgcHJvdmlkZWQgYnkg
a2VybmVsLCBpdCBpcyBleHBlY3RlZCB0bwo+ID4gPiA+ID4gbWVldCBhcyBnZW5lcmFsIG5lZWRz
IGFzIHBvc3NpYmxlLiBTbywgZG8geW91IHRoaW5rIHRoZXJlIGFyZSBzdWNoIHVzZQo+ID4gPiA+
ID4gY2FzZXMgZnJvbSB1c2VyIHNwYWNlIHRoYXQgdXNlciBzcGFjZSBrbm93cyB3ZWxsIG9mIHRo
ZSBkZXZpY2UsIGFuZAo+ID4gPiA+ID4gaXQgd2FudHMga2VybmVsIHRvIHJldHVybiBkZXNpcmVk
IGRhdGEgYmFjayB0byBpdC4KPiA+ID4gPiA+IEUuZy4gSXQganVzdCB3YW50cyB0byBnZXQgd2hv
bGUgZGV2aWNlIGNvbmZpZyBkYXRhIGluY2x1ZGluZyBhbGwgbW1pb3MsCj4gPiA+ID4gPiBwYWdl
IHRhYmxlcywgcGNpIGNvbmZpZyBkYXRhLi4uCj4gPiA+ID4gPiBvciwgSXQganVzdCB3YW50cyB0
byBnZXQgY3VycmVudCBkZXZpY2UgbWVtb3J5IHNuYXBzaG90LCBub3QgaW5jbHVkaW5nIGFueQo+
ID4gPiA+ID4gZGlydHkgZGF0YS4KPiA+ID4gPiA+IE9yLCBJdCBqdXN0IG5lZWRzIHRoZSBkaXJ0
eSBwYWdlcyBpbiBkZXZpY2UgbWVtb3J5IG9yIHN5c3RlbSBtZW1vcnkuCj4gPiA+ID4gPiBXaXRo
IGFsbCB0aGlzIGFjY3VyYXRlIHF1ZXJ5LCBxdWl0ZSBhIGxvdCBvZiB1c2VmdWwgZmVhdHVyZXMg
Y2FuIGJlCj4gPiA+ID4gPiBkZXZlbG9wcGVkIGluIHVzZXIgc3BhY2UuCj4gPiA+ID4gPgo+ID4g
PiA+ID4gSWYgYWxsIG9mIHRoaXMgZGF0YSBpcyBvcGFxdWUgdG8gdXNlciBhcHAsIHNlZW1zIHRo
ZSBvbmx5IHVzZSBjYXNlIGlzCj4gPiA+ID4gPiBmb3IgbGl2ZSBtaWdyYXRpb24uICAgIAo+ID4g
PiA+IAo+ID4gPiA+IEkgY2FuIGNlcnRhaW5seSBhcHByZWNpYXRlIGEgbW9yZSB2ZXJzYXRpbGUg
aW50ZXJmYWNlLCBidXQgSSB0aGluawo+ID4gPiA+IHdlJ3JlIGFsc28gdHJ5aW5nIHRvIGNyZWF0
ZSB0aGUgbW9zdCBzaW1wbGUgaW50ZXJmYWNlIHdlIGNhbiwgd2l0aCB0aGUKPiA+ID4gPiBwcmlt
YXJ5IHRhcmdldCBiZWluZyBsaXZlIG1pZ3JhdGlvbi4gIEFzIHNvb24gYXMgd2Ugc3RhcnQgZGVm
aW5pbmcgdGhpcwo+ID4gPiA+IHR5cGUgb2YgZGV2aWNlIG1lbW9yeSBhbmQgdGhhdCB0eXBlIG9m
IGRldmljZSBtZW1vcnksIHdlJ3JlIGdvaW5nIHRvCj4gPiA+ID4gaGF2ZSBhbm90aGVyIGRldmlj
ZSBjb21lIGFsb25nIHRoYXQgbmVlZHMgeWV0IGFub3RoZXIgYmVjYXVzZSB0aGV5IGhhdmUKPiA+
ID4gPiBhIHNsaWdodGx5IGRpZmZlcmVudCByZXF1aXJlbWVudC4gIEV2ZW4gd2l0aG91dCB0aGF0
LCB3ZSdyZSBnb2luZyB0bwo+ID4gPiA+IGhhdmUgdmVuZG9yIGRyaXZlcnMgaW1wbGVtZW50IGl0
IGRpZmZlcmVudGx5LCBzbyB3aGF0IHdvcmtzIGZvciBvbmUKPiA+ID4gPiBkZXZpY2UgZm9yIGEg
bW9yZSB0YXJnZXRlZCBhcHByb2FjaCBtYXkgbm90IHdvcmsgZm9yIGFsbCBkZXZpY2VzLiAgQ2Fu
Cj4gPiA+ID4geW91IGVudW1lcmF0ZSBzb21lIHNwZWNpZmljIGV4YW1wbGVzIG9mIHRoZSB1c2Ug
Y2FzZXMgeW91IGltYWdpbmUgeW91cgo+ID4gPiA+IGRlc2lnbiB0byBlbmFibGU/Cj4gPiA+ID4g
ICAgIAo+ID4gPiAKPiA+ID4gRG8gd2Ugd2FudCB0byBjb25zaWRlciBhbiB1c2UgY2FzZSB3aGVy
ZSB1c2VyIHNwYWNlIHdvdWxkIGxpa2UgdG8KPiA+ID4gc2VsZWN0aXZlbHkgaW50cm9zcGVjdCBh
IHBvcnRpb24gb2YgdGhlIGRldmljZSBzdGF0ZSAoaW5jbHVkaW5nIGltcGxpY2l0IAo+ID4gPiBz
dGF0ZSB3aGljaCBhcmUgbm90IGF2YWlsYWJsZSB0aHJvdWdoIFBDSSByZWdpb25zKSwgYW5kIG1h
eSBhc2sgZm9yCj4gPiA+IGNhcGFiaWxpdHkgb2YgZGlyZWN0IG1hcHBpbmcgb2Ygc2VsZWN0ZWQg
cG9ydGlvbiBmb3Igc2Nhbm5pbmcgKGUuZy4KPiA+ID4gZGV2aWNlIG1lbW9yeSkgaW5zdGVhZCBv
ZiBhbHdheXMgdHVybmluZyBvbiBkaXJ0eSBsb2dnaW5nIG9uIGFsbAo+ID4gPiBkZXZpY2Ugc3Rh
dGU/ICAKPiA+IAo+ID4gSSBkb24ndCBzZWUgdGhhdCBhIG1pZ3JhdGlvbiBpbnRlcmZhY2UgbmVj
ZXNzYXJpbHkgbGVuZHMgaXRzZWxmIHRvIHRoaXMKPiA+IHVzZSBjYXNlLiAgQSBtaWdyYXRpb24g
ZGF0YSBzdHJlYW0gaGFzIG5vIHJlcXVpcmVtZW50IHRvIGJlIHVzZXIKPiA+IGNvbnN1bWFibGUg
YXMgYW55dGhpbmcgb3RoZXIgdGhhbiBvcGFxdWUgZGF0YSwgdGhlcmUncyBhbHNvIG5vCj4gPiBy
ZXF1aXJlbWVudCB0aGF0IGl0IGV4cG9zZSBzdGF0ZSBpbiBhIGZvcm0gdGhhdCBkaXJlY3RseSBy
ZXByZXNlbnRzIHRoZQo+ID4gaW50ZXJuYWwgc3RhdGUgb2YgdGhlIGRldmljZS4gIEluIGZhY3Qg
SSdtIG5vdCBzdXJlIHdlIHdhbnQgdG8gZW5jb3VyYWdlCj4gPiBpbnRyb3NwZWN0aW9uIHZpYSB0
aGlzIGRhdGEgc3RyZWFtLiAgSWYgYSB1c2VyIGtub3dzIGhvdyB0byBpbnRlcnByZXQKPiA+IHRo
ZSBkYXRhLCB3aGF0IHByZXZlbnRzIHRoZW0gZnJvbSBtb2RpZnlpbmcgdGhlIGRhdGEgaW4tZmxp
Z2h0PyAgSSd2ZQo+ID4gcmFpc2VkIHRoZSBxdWVzdGlvbiBwcmV2aW91c2x5IHJlZ2FyZGluZyBo
b3cgdGhlIHZlbmRvciBkcml2ZXIgY2FuCj4gPiB2YWxpZGF0ZSB0aGUgaW50ZWdyaXR5IG9mIHRo
ZSBtaWdyYXRpb24gZGF0YSBzdHJlYW0uICBVc2luZyB0aGUKPiA+IG1pZ3JhdGlvbiBpbnRlcmZh
Y2UgdG8gaW50cm9zcGVjdCB0aGUgZGV2aWNlIGNlcnRhaW5seSBzdWdnZXN0cyBhbgo+ID4gaW50
ZXJmYWNlIHJpcGUgZm9yIGV4cGxvaXRpbmcgYW55IHBvdGVudGlhbCB3ZWFrbmVzcyBpbiB0aGUg
dmVuZG9yCj4gPiBkcml2ZXIgcmVhc3NlbWJsaW5nIHRoYXQgbWlncmF0aW9uIHN0cmVhbS4gIElm
IHRoZSB1c2VyIGhhcyBhbiBtbWFwIHRvCj4gPiB0aGUgYWN0dWFsIGxpdmUgd29ya2luZyBzdGF0
ZSBvZiB0aGUgdmVuZG9yIGRyaXZlciwgcHJvdGVjdGlvbiBpbiB0aGUKPiA+IGhhcmR3YXJlIHNl
ZW1zIGxpa2UgdGhlIG9ubHkgd2F5IHlvdSBjb3VsZCBwcm90ZWN0IGFnYWluc3QgYSBtYWxpY2lv
dXMKPiA+IHVzZXIuICBQbGVhc2UgYmUgZGVmZW5zaXZlIGluIHdoYXQgaXMgZGlyZWN0bHkgZXhw
b3NlZCB0byB0aGUgdXNlciBhbmQKPiA+IHdoYXQgc2FmZWd1YXJkcyBhcmUgaW4gcGxhY2Ugd2l0
aGluIHRoZSB2ZW5kb3IgZHJpdmVyIGZvciB2YWxpZGF0aW5nCj4gPiBpbmNvbWluZyBkYXRhLiAg
VGhhbmtzLCAgCj4gCj4gSG1tOyB0aGF0IHNvdW5kcyBsaWtlIGEgc2VjdXJpdHktYnktb2JzY3Vy
aXR5IGFuc3dlciEKCll1cCwgdGhhdCdzIGZhaXIuICBJIHdvbid0IGRlbnkgdGhhdCBpbi1rZXJu
ZWwgdmVuZG9yIGRyaXZlciBzdGF0ZQpwYXNzaW5nIHRocm91Z2ggdXNlcnNwYWNlIGZyb20gc291
cmNlIHRvIHRhcmdldCBzeXN0ZW1zIHNjYXJlcyBtZSBxdWl0ZQphIGJpdCwgYnV0IGRlZmluaW5n
IGRldmljZSBpbnRyb3NwZWN0aW9uIGFzIGEgdXNlIGNhc2UgZm9yIHRoZQptaWdyYXRpb24gaW50
ZXJmYWNlIGltcG9zZXMgcmVxdWlyZW1lbnRzIG9uIHRoZSB2ZW5kb3IgZHJpdmVycyB0aGF0CmRv
bid0IG90aGVyd2lzZSBleGlzdC4gIE1kZXYgdmVuZG9yIHNwZWNpZmljIHV0aWxpdGllcyBjb3Vs
ZCBhbHdheXMgYmUKd3JpdHRlbiB0byBpbnRlcnByZXQgdGhlIG1pZ3JhdGlvbiBzdHJlYW0gdG8g
ZGVkdWNlIHRoZSBpbnRlcm5hbCBzdGF0ZSwKYnV0IEkgdGhpbmsgdGhhdCBpbXBvc2luZyBzZWdy
ZWdhdGVkIGRldmljZSBtZW1vcnkgdnMgZGV2aWNlIGNvbmZpZwpyZWdpb25zIHdpdGggdGhlIGV4
cGVjdGF0aW9uIHRoYXQgaW50ZXJuYWwgc3RhdGUgY2FuIGJlIGRpcmVjdGx5CnRyYWNrZWQgaXMg
YmV5b25kIHRoZSBzY29wZSBvZiBhIG1pZ3JhdGlvbiBpbnRlcmZhY2UuCiAKPiBUaGUgc2NyaXB0
cy9hbmFseXplLW1pZ3JhdGlvbi5weSBzY3JpcHRzIHdpbGwgYWN0dWFsbHkgZHVtcCB0aGUKPiBt
aWdyYXRpb24gc3RyZWFtIGRhdGEgaW4gYW4gYWxtb3N0IHJlYWRhYmxlIGZvcm1hdC4KPiBTbyBp
ZiB5b3UgcHJvcGVybHkgZGVmaW5lIHRoZSBWTVN0YXRlIGRlZmluaXRpb25zIGl0IHNob3VsZCBi
ZSBhbG1vc3QKPiByZWFkYWJsZTsgaXQncyBvY2Nhc2lvbmFsbHkgYmVlbiB1c2VmdWwuCgpUaGF0
J3MgdHJ1ZSBmb3IgZW11bGF0ZWQgZGV2aWNlcywgYnV0IEkgZXhwZWN0IGFuIG1kZXYgZGV2aWNl
IG1pZ3JhdGlvbgpzdHJlYW0gaXMgc2ltcGx5IG9uZSBibG9iIG9mIG9wYXF1ZSBkYXRhIGZvbGxv
d2VkIGJ5IGFub3RoZXIuICBXZSBjYW4KaW1wb3NlIHRoZSBwcm90b2NvbCB0aGF0IHVzZXJzcGFj
ZSB1c2VzIHRvIHJlYWQgYW5kIHdyaXRlIHRoaXMgZGF0YQpzdHJlYW0gZnJvbSB0aGUgZGV2aWNl
LCBidXQgbm90IHRoZSBkYXRhIGl0IGNvbnRhaW5zLgogCj4gSSBhZ3JlZSB0aGF0IHlvdSBzaG91
bGQgYmUgdmVyeSB2ZXJ5IGNhcmVmdWwgdG8gdmFsaWRhdGUgdGhlIGluY29taW5nCj4gbWlncmF0
aW9uIHN0cmVhbSBhZ2FpbnN0Ogo+ICAgYSkgQ29ycnVwdGlvbgo+ICAgYikgV3JvbmcgZHJpdmVy
IHZlcnNpb25zCj4gICBjKSBNYWxpY2lvdXMgaW50ZW50Cj4gICAgIGMuMSkgRXNwZWNpYWxseSBi
eSB0aGUgZ3Vlc3QKPiAgICAgYy4yKSBPciBieSBzb21lb25lIHRyeWluZyB0byBmZWVkIHlvdSBh
IGR1ZmYgc3RyZWFtCj4gICBkKSBTb21lb25lIHRyeWluZyBsb2FkIHRoZSBWRklPIHN0cmVhbSBp
bnRvIGNvbXBsZXRlbHkgdGhlIHdyb25nCj4gZGV2aWNlLgoKWWVzLCBhbmQgd2l0aCBvcGVuIHNv
dXJjZSBtZGV2IHZlbmRvciBkcml2ZXJzIHdlIGNhbiBhdCBsZWFzdAp0aGVvcmV0aWNhbGx5IGF1
ZGl0IHRoZSByZWxvYWQsIGJ1dCBvZiBjb3Vyc2Ugd2UgYWxzbyBoYXZlIHByb3ByaWV0YXJ5CmRy
aXZlcnMuICBJIHdvbmRlciBpZiB3ZSBzaG91bGQgaW5zdGFsbCB0aGUga2lsbCBzd2l0Y2ggaW4g
YWR2YW5jZSB0bwphbGxvdyB1c2VycyB0byBvcHQtb3V0IG9mIGVuYWJsaW5nIG1pZ3JhdGlvbiBh
dCB0aGUgbWRldiBsYXllci4KCj4gV2hldGhlciB0aGUgbWlncmF0aW9uIGludGVyZmFjZSBpcyB0
aGUgcmlnaHQgdGhpbmcgdG8gdXNlIGZvciB0aGF0Cj4gaW5zcGVjdGlvbiBobW07IHdlbGwgaXQg
bWlnaHQgYmUgLSBpZiB5b3UncmUgdHJ5aW5nIHRvIGRlYnVnCj4geW91ciBkZXZpY2UgYW5kIG5l
ZWQgYSBkdW1wIG9mIGl0J3Mgc3RhdGUsIHRoZW4gd2h5IG5vdD8KPiAoSSBndWVzcyB5b3UgZW5k
IHVwIHdpdGggc29tZXRoaW5nIG5vdCBkaXNzaW1pbGFyIHRvIHdoYXQgdGhpbmdzCj4gbGlrZSBp
bnRla19yZWdfc25hcHNob3QgaW4gaW50ZWwtZ3B1LXRvb2xzIGRvZXMpLgoKU3VyZSwgYXMgYWJv
dmUgdGhlcmUncyBub3RoaW5nIHByZXZlbnRpbmcgbWRldiBzcGVjaWZpYyB1dGlsaXRpZXMgZnJv
bQpkZWNvZGluZyB0aGUgbWlncmF0aW9uIHN0cmVhbSwgYnV0IEkgYmVnaW4gdG8gaGF2ZSBhbiBp
c3N1ZSBpZiB0aGlzCmludHJvc3BlY3RpdmUgdXNlIGNhc2UgaW1wb3NlcyByZXF1aXJlbWVudHMg
b24gaG93IGRldmljZSBzdGF0ZSBpcwpyZXByZXNlbnRlZCB0aHJvdWdoIHRoZSBtaWdyYXRpb24g
aW50ZXJmYWNlIHRoYXQgZG9uJ3Qgb3RoZXJ3aXNlCmV4aXN0LiAgSWYgd2Ugd2FudCB0byBkZWZp
bmUgYSBzdGFuZGFyZCBmb3IgdGhlIGFjdHVhbCBkYXRhIGZyb20gdGhlCmRldmljZSwgd2UnbGwg
YmUgYXQgdGhpcyBmb3IgeWVhcnMgOi1cICBUaGFua3MsCgpBbGV4Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0
CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==

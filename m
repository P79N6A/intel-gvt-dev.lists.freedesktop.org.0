Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp5308910ywb;
        Thu, 14 Mar 2019 15:45:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwa44WUPAOyPy3usVun79nfGOjmXJPM6zqmq1kO7tLkExtHppQEo01dwmwFNn9a2bpnEyqy
X-Received: by 2002:a17:902:8203:: with SMTP id x3mr724487pln.159.1552603511108;
        Thu, 14 Mar 2019 15:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552603511; cv=none;
        d=google.com; s=arc-20160816;
        b=nKoW5GF3noCJaRRDcFVf7iArWY0CLigO62fRzsg3LpugpTdBTa4iJp0io0R+dNxm6/
         60lzvQLuGTgN20PQts6LD1DrUIOlpi0JrG+B5m6nmOG8zuWOjhx2enk4LoCEgDEa9KnG
         BwMGAmbGO+Svjns2dinUAlnpTZ7ure5pUANr3Edq1VX5Is6civLwXsDy12JVKoHa6KYl
         r3YjikDLGGTqvjZCPdcA4lwQbbz4fKzyfGuWgdkRe5GCEOdURgwrN6/10+Ss0paKJKbr
         If+sQCBPq4g/TE3G2uvtLORPgCUlAeFTV2EYUejAGuqksVAtd2QPD6jx332xICOhxu6h
         cjrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:subject
         :to:from:date:delivered-to;
        bh=FjJpbxtsQkGyFBM4Hm/Jw0YpubDDs3FPiQQf/JDLFDs=;
        b=CWFqgFUUI0Hz5AH8o98T5ZIRZEZochZGdwGqEX6QHKkZhtIFZJB/Ho7V3/oc2C+kq8
         eLgL2jHZFNcjg80rwMWyMfMoshE5WKaZJXmBZzKYzRFxkwsEi/6f3x0eDSyl7przr5JP
         UQsb0iMHrHm3gkRS1UQoEKIwjwUjV4xCEmxUIElpfDenm+74AR4z4pVt0x4xGG+ncZxS
         ca4KkiZ3VxxnbXKpsqN7YxNoIoQj4Xra8T1Ze5bG8rKlKwPCl2hK78nNXd76jR9FmNmZ
         iTfi9DdINozykLKAJcm92HZOoJzsxfLsamdOG9NaX28Pdnoyfn2wUckaUzfkFiU0+ihM
         g1Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id n34si116122pld.163.2019.03.14.15.45.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Mar 2019 15:45:11 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3126E17C;
	Thu, 14 Mar 2019 22:45:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BFF6E17C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 14 Mar 2019 22:45:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B44D22DC36D;
 Thu, 14 Mar 2019 22:45:02 +0000 (UTC)
Received: from w520.home (ovpn-116-24.phx2.redhat.com [10.3.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AE5A60BE6;
 Thu, 14 Mar 2019 22:44:59 +0000 (UTC)
Date: Thu, 14 Mar 2019 16:44:58 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Zhao Yan <yan.y.zhao@intel.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190314164458.0d1977c3@w520.home>
In-Reply-To: <20190314011222.GA17006@joy-OptiPlex-7040>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190221134051.2c28893e@w520.home>
 <20190225022255.GP16456@joy-OptiPlex-7040>
 <20190307104421.534ea56f@w520.home>
 <20190312025747.GI21353@joy-OptiPlex-7040>
 <20190313011301.GA16072@joy-OptiPlex-7040>
 <20190313131454.09f886c1@w520.home>
 <20190314011222.GA17006@joy-OptiPlex-7040>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 14 Mar 2019 22:45:09 +0000 (UTC)
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
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi
 L" <yi.l.liu@intel.com>, "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gV2VkLCAxMyBNYXIgMjAxOSAyMToxMjoyMiAtMDQwMApaaGFvIFlhbiA8eWFuLnkuemhhb0Bp
bnRlbC5jb20+IHdyb3RlOgoKPiBPbiBUaHUsIE1hciAxNCwgMjAxOSBhdCAwMzoxNDo1NEFNICsw
ODAwLCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6Cj4gPiBPbiBUdWUsIDEyIE1hciAyMDE5IDIxOjEz
OjAxIC0wNDAwCj4gPiBaaGFvIFlhbiA8eWFuLnkuemhhb0BpbnRlbC5jb20+IHdyb3RlOgo+ID4g
ICAKPiA+ID4gaGkgQWxleAo+ID4gPiBBbnkgY29tbWVudHMgdG8gdGhlIHNlcXVlbmNlIGJlbG93
Pwo+ID4gPiAKPiA+ID4gQWN0YXVsbHkgd2UgaGF2ZSBzb21lIGNvbmNlcm5zIGFuZCBzdWdnZXN0
aW9ucyB0byB1c2Vyc3BhY2Utb3BhcXVlIG1pZ3JhdGlvbgo+ID4gPiBkYXRhLgo+ID4gPiAKPiA+
ID4gMS4gaWYgZGF0YSBpcyBvcGFxdWUgdG8gdXNlcnNwYWNlLCBrZXJuZWwgaW50ZXJmYWNlIG11
c3QgYmUgdGlnaHRseSBib3VuZCB0bwo+ID4gPiBtaWdyYXRpb24uIAo+ID4gPiAgICBlLmcuIHZl
bmRvciBkcml2ZXIgaGFzIHRvIGtub3cgc3RhdGUgKHJ1bm5pbmcgKyBub3QgbG9nZ2luZykgc2hv
dWxkIG5vdAo+ID4gPiAgICByZXR1cm4gYW55IGRhdGEsIGFuZCBzdGF0ZSAocnVubmluZyArIGxv
Z2dpbmcpIHNob3VsZCByZXR1cm4gd2hvbGUKPiA+ID4gICAgc25hcHNob3QgZmlyc3QgYW5kIGRp
cnR5IGxhdGVyLiBpdCBhbHNvIGhhcyB0byBrbm93IHFlbXUgbWlncmF0aW9uIHdpbGwKPiA+ID4g
ICAgbm90IGNhbGwgR0VUX0JVRkZFUiBpbiBzdGF0ZSAocnVubmluZyArIG5vdCBsb2dnaW5nKSwg
b3RoZXJ3aXNlLCBpdCBoYXMKPiA+ID4gICAgdG8gYWRqdXN0IGl0cyBiZWhhdmlvci4gIAo+ID4g
Cj4gPiBUaGlzIGFsbCBqdXN0IHNvdW5kcyBsaWtlIGRlZmluaW5nIHRoZSBwcm90b2NvbCB3ZSBl
eHBlY3Qgd2l0aCB0aGUKPiA+IGludGVyZmFjZS4gIEZvciBpbnN0YW5jZSBpZiB3ZSBkZWZpbmUg
YSBzZXNzaW9uIGFzIGJlZ2lubmluZyB3aGVuCj4gPiBsb2dnaW5nIGlzIGVuYWJsZWQgYW5kIGVu
ZGluZyB3aGVuIHRoZSBkZXZpY2UgaXMgc3RvcHBlZCBhbmQgdGhlCj4gPiBpbnRlcmZhY2UgcmVw
b3J0cyBubyBtb3JlIGRhdGEgaXMgYXZhaWxhYmxlLCB0aGVuIHdlIGNhbiBzdGF0ZSB0aGF0IGFu
eQo+ID4gcGFydGlhbCBhY2N1bXVsYXRpb24gb2YgZGF0YSBpcyBpbmNvbXBsZXRlIHJlbGF0aXZl
IHRvIG1pZ3JhdGlvbi4gIElmCj4gPiB1c2Vyc3BhY2Ugd2FudHMgdG8gaW5pdGlhdGUgYSBuZXcg
bWlncmF0aW9uIHN0cmVhbSwgdGhleSBjYW4gc2ltcGx5Cj4gPiB0b2dnbGUgbG9nZ2luZy4gIEhv
dyB0aGUgdmVuZG9yIGRyaXZlciBwcm92aWRlcyB0aGUgZGF0YSBkdXJpbmcgdGhlCj4gPiBzZXNz
aW9uIGlzIG5vdCBkZWZpbmVkLCBidXQgYmVnaW5uaW5nIHRoZSBzZXNzaW9uIHdpdGggYSBzbmFw
c2hvdAo+ID4gZm9sbG93ZWQgYnkgcmVwZWF0ZWQgaXRlcmF0aW9ucyBvZiBkaXJ0aWVkIGRhdGEg
aXMgY2VydGFpbmx5IGEgdmFsaWQKPiA+IGFwcHJvYWNoLgo+ID4gICAKPiA+ID4gMi4gdmVuZG9y
IGRyaXZlciBjYW5ub3QgZW5zdXJlIHVzZXJzcGFjZSBnZXQgYWxsIHRoZSBkYXRhIGl0IGludGVu
ZHMgdG8KPiA+ID4gc2F2ZSBpbiBwcmUtY29weSBwaGFzZS4KPiA+ID4gICBlLmcuIGluIHN0b3At
YW5kLWNvcHkgcGhhc2UsIHZlbmRvciBkcml2ZXIgaGFzIHRvIGZpcnN0IGNoZWNrIGFuZCBzZW5k
Cj4gPiA+ICAgZGF0YSBpbiBwcmV2aW91cyBwaGFzZS4gIAo+ID4gCj4gPiBGaXJzdCwgSSBkb24n
dCB0aGluayB0aGUgZGV2aWNlIGhhcyBjb250cm9sIG9mIHdoZW4gUUVNVSBzd2l0Y2hlcyBmcm9t
Cj4gPiBwcmUtY29weSB0byBzdG9wLWFuZC1jb3B5LCB0aGUgcHJvdG9jb2wgbmVlZHMgdG8gc3Vw
cG9ydCB0aGF0Cj4gPiB0cmFuc2l0aW9uIGF0IGFueSBwb2ludC4gIEhvd2V2ZXIsIGl0IHNlZW1z
IGEgc2ltcGx5IGRhdGEgYXZhaWxhYmxlCj4gPiBjb3VudGVyIHByb3ZpZGVzIGFuIGluZGljYXRp
b24gb2Ygd2hlbiBpdCBtaWdodCBiZSBvcHRpbWFsIHRvIG1ha2Ugc3VjaAo+ID4gYSB0cmFuc2l0
aW9uLiAgSWYgYSB2ZW5kb3IgZHJpdmVyIGZvbGxvd3MgYSBzY2hlbWUgYXMgYWJvdmUsIHRoZQo+
ID4gYXZhaWxhYmxlIGRhdGEgY291bnRlciB3b3VsZCBpbmRpY2F0ZSBhIGxhcmdlIHZhbHVlLCB0
aGUgZW50aXJlIGluaXRpYWwKPiA+IHNuYXBzaG90IG9mIHRoZSBkZXZpY2UuICBBcyB0aGUgbWln
cmF0aW9uIGNvbnRpbnVlcyBhbmQgcGFnZXMgYXJlCj4gPiBkaXJ0aWVkLCB0aGUgZGV2aWNlIHdv
dWxkIHJlYWNoIGEgc3RlYWR5IHN0YXRlIGFtb3VudCBvZiBkYXRhCj4gPiBhdmFpbGFibGUsIGRl
cGVuZGluZyBvbiB0aGUgZ3Vlc3QgYWN0aXZpdHkuICBUaGlzIGNvdWxkIGluZGljYXRlIHRvIHRo
ZQo+ID4gdXNlciB0byBzdG9wIHRoZSBkZXZpY2UuICBUaGUgbWlncmF0aW9uIHN0cmVhbSB3b3Vs
ZCBub3QgYmUgY29uc2lkZXJlZAo+ID4gY29tcGxldGVkIHVudGlsIHRoZSBhdmFpbGFibGUgZGF0
YSBjb3VudGVyIHJlYWNoZXMgemVybyB3aGlsZSB0aGUKPiA+IGRldmljZSBpcyBpbiB0aGUgc3Rv
cHBlZHxsb2dnaW5nIHN0YXRlLgo+ID4gICAKPiA+ID4gMy4gaWYgYWxsIHRoZSBzZXF1ZW5jZSBp
cyB0aWdodGx5IGJvdW5kIHRvIGxpdmUgbWlncmF0aW9uLCBjYW4gd2UgcmVtb3ZlIHRoZQo+ID4g
PiBsb2dnaW5nIHN0YXRlPyB3aGF0IGFib3V0IGFkZGluZyB0d28gc3RhdGVzIG1pZ3JhdGUtaW4g
YW5kIG1pZ3JhdGUtb3V0Pwo+ID4gPiBzbyB0aGVyZSBhcmUgZm91ciBzdGF0ZXM6IHJ1bm5pbmcs
IHN0b3BwZWQsIG1pZ3JhdGUtaW4sIG1pZ3JhdGUtb3V0Lgo+ID4gPiAgICBtaWdyYXRlLW91dCBp
cyBmb3Igc291cmNlIHNpZGUgd2hlbiBtaWdyYXRpb24gc3RhcnRzLiB0b2dldGhlciB3aXRoCj4g
PiA+ICAgIHN0YXRlIHJ1bm5pbmcgYW5kIHN0b3BwZWQsIGl0IGNhbiBzdWJzdGl0dXRlIHN0YXRl
IGxvZ2dpbmcuCj4gPiA+ICAgIG1pZ3JhdGUtaW4gaXMgZm9yIHRhcmdldCBzaWRlLiAgCj4gPiAK
PiA+IEluIGZhY3QsIEtpcnRpJ3MgaW1wbGVtZW50YXRpb24gc3BlY2lmaWVzIGEgZGF0YSBkaXJl
Y3Rpb24sIGJ1dCBJIHRoaW5rCj4gPiB3ZSBzdGlsbCBuZWVkIGxvZ2dpbmcgdG8gaW5kaWNhdGUg
c2Vzc2lvbnMuICBJJ2QgYWxzbyBhc3N1bWUgdGhhdAo+ID4gbG9nZ2luZyBpbXBsaWVzIHNvbWUg
b3ZlcmhlYWQgZm9yIHRoZSB2ZW5kb3IgZHJpdmVyLgo+ID4gIAo+IG9rLiBJZiB5b3UgcHJlZmVy
IGxvZ2dpbmcsIEknbSBvayB3aXRoIGl0LiBqdXN0IGZvdW5kIG1pZ3JhdGUtaW4gYW5kCj4gbWln
cmF0ZS1vdXQgYXJlIG1vcmUgdW5pdmVyc2FsIGFnYWludCBoYXJkd2FyZSByZXF1aXJlbWVudCBj
aGFuZ2VzLgo+IAo+ID4gPiBPbiBUdWUsIE1hciAxMiwgMjAxOSBhdCAxMDo1Nzo0N0FNICswODAw
LCBaaGFvIFlhbiB3cm90ZTogIAo+ID4gPiA+IGhpIEFsZXgKPiA+ID4gPiB0aGFua3MgZm9yIHlv
dXIgcmVwbHkuCj4gPiA+ID4gCj4gPiA+ID4gU28sIGlmIHdlIGNob29zZSBtaWdyYXRpb24gZGF0
YSB0byBiZSB1c2Vyc3BhY2Ugb3BhcXVlLCBkbyB5b3UgdGhpbmsgYmVsb3cKPiA+ID4gPiBzZXF1
ZW5jZSBpcyB0aGUgcmlnaHQgYmVoYXZpb3IgZm9yIHZlbmRvciBkcml2ZXIgdG8gZm9sbG93Ogo+
ID4gPiA+IAo+ID4gPiA+IDEuIGluaXRpYWxseSBMT0dHSU5HIHN0YXRlIGlzIG5vdCBzZXQuIElm
IHVzZXJzcGFjZSBjYWxscyBHRVRfQlVGRkVSIHRvCj4gPiA+ID4gdmVuZG9yIGRyaXZlciwgIHZl
bmRvciBkcml2ZXIgc2hvdWxkIHJlamVjdCBhbmQgcmV0dXJuIDAuICAKPiA+IAo+ID4gV2hhdCB3
b3VsZCB0aGlzIHN0YXRlIG1lYW4gb3RoZXJ3aXNlPyAgSWYgd2UncmUgbm90IGxvZ2dpbmcgdGhl
biBpdAo+ID4gc2hvdWxkIG5vdCBiZSBleHBlY3RlZCB0aGF0IHdlIGNhbiBjb25zdHJ1Y3QgZGly
dGllZCBkYXRhIGZyb20gYQo+ID4gcHJldmlvdXMgcmVhZCBvZiB0aGUgc3RhdGUgYmVmb3JlIGxv
Z2dpbmcgd2FzIGVuYWJsZWQgKGl0IHdvdWxkIGJlCj4gPiBvdXRzaWRlIG9mIHRoZSAic2Vzc2lv
biIpLiAgU28gYXQgYmVzdCB0aGlzIGlzIGFuIGluY29tcGxldGUgc2VnbWVudCBvZgo+ID4gdGhl
IGluaXRpYWwgc25hcHNob3Qgb2YgdGhlIGRldmljZSwgYnV0IHRoYXQgcHJlc3VtZXMgaG93IHRo
ZSB2ZW5kb3IKPiA+IGRyaXZlciBjb25zdHJ1Y3RzIHRoZSBkYXRhLiAgSSB3b3VsZG4ndCBuZWNl
c3NhcmlseSBtYW5kYXRlIHRoZSB2ZW5kb3IKPiA+IGRyaXZlciByZWplY3QgaXQsIGJ1dCBJIHRo
aW5rIHdlIHNob3VsZCBjb25zaWRlciBpdCB1bmRlZmluZWQgYW5kCj4gPiB2ZW5kb3Igc3BlY2lm
aWMgcmVsYXRpdmUgdG8gdGhlIG1pZ3JhdGlvbiBpbnRlcmZhY2UuCj4gPiAgIAo+ID4gPiA+IDIu
IHRoZW4gTE9HR0lORyBzdGF0ZSBpcyBzZXQsIGlmIHVzZXJzcGFjZSBjYWxscyBHRVRfQlVGRkVS
IHRvIHZlbmRvcgo+ID4gPiA+IGRyaXZlciwKPiA+ID4gPiAgICBhLiB2ZW5kb3IgZHJpdmVyIHNo
b3VkIGZpcnN0IHF1ZXJ5IGEgd2hvbGUgc25hcHNob3Qgb2YgZGV2aWNlIG1lbW9yeQo+ID4gPiA+
ICAgIChsZXQncyB1c2UgdGhpcyB0ZXJtIHRvIHJlcHJlc2VudCBkZXZpY2UncyBzdGFuZGFsb25l
IG1lbW9yeSBmb3Igbm93KSwKPiA+ID4gPiAgICBiLiB2ZW5kb3IgZHJpdmVyIHJldHVybnMgYSBj
aHVuayBvZiBkYXRhIGp1c3QgcXVlcmllZCB0byB1c2Vyc3BhY2UsCj4gPiA+ID4gICAgd2hpbGUg
cmVjb3JkaW5nIGN1cnJlbnQgcG9zIGluIGRhdGEuCj4gPiA+ID4gICAgYy4gdmVuZG9yIGRyaXZl
ciBmaW5kcyBhbGwgZGF0YSBqdXN0IHF1ZXJpZWQgaXMgZmluaXNoZWQgdHJhbnNtaXR0aW5nIHRv
Cj4gPiA+ID4gICAgdXNlcnNwYWNlLCBhbmQgcXVlcmllcyBvbmx5IGRpcnR5IGRhdGEgaW4gZGV2
aWNlIG1lbW9yeSBub3cuCj4gPiA+ID4gICAgZC4gdmVuZG9yIGRyaXZlciByZXR1cm5zIGEgY2h1
bmsgb2YgZGF0YSBqdXN0IHF1ZXJlZCAodGhpcyB0aW1lIGlzIGRpcnR5Cj4gPiA+ID4gICAgZGF0
YSApdG8gdXNlcnNwYWNlIHdoaWxlIHJlY29yZGluZyBjdXJyZW50IHBvcyBpbiBkYXRhCj4gPiA+
ID4gICAgZS4gaWYgYWxsIGRhdGEgaXMgdHJhbnNtaXRlZCB0byB1c2VzcGFjZSBhbmQgc3RpbGwg
R0VUX0JVRkZFUnMgY29tZSBmcm9tCj4gPiA+ID4gICAgdXNlcnNwYWNlLCB2ZW5kb3IgZHJpdmVy
IHN0YXJ0cyBhbm90aGVyIHJvdW5kIG9mIGRpcnR5IGRhdGEgcXVlcnkuICAKPiA+IAo+ID4gVGhp
cyBpcyBhIHZhbGlkIHZlbmRvciBkcml2ZXIgYXBwcm9hY2gsIGJ1dCBpdCdzIG91dHNpZGUgdGhl
IHNjb3BlIG9mCj4gPiB0aGUgaW50ZXJmYWNlIGRlZmluaXRpb24uICBBIHZlbmRvciBkcml2ZXIg
Y291bGQgYWxzbyBkZWNpZGUgdG8gbm90Cj4gPiBwcm92aWRlIGFueSBkYXRhIHVudGlsIGJvdGgg
c3RvcHBlZCBhbmQgbG9nZ2luZyBhcmUgc2V0IGFuZCB0aGVuCj4gPiBwcm92aWRlIGEgZml4ZWQs
IGZpbmFsIHNuYXBzaG90LiAgVGhlIGludGVyZmFjZSBzdXBwb3J0cyBlaXRoZXIKPiA+IGFwcHJv
YWNoIGJ5IGRlZmluaW5nIHRoZSBwcm90b2NvbCB0byBpbnRlcmFjdCB3aXRoIGl0Lgo+ID4gICAK
PiA+ID4gPiAzLiBpZiBMT0dHSU5HIHN0YXRlIGlzIHVuc2V0IHRoZW4sIGFuZCB1c2VycGFjZSBj
YWxscyBHRVRfQlVGRkVSIHRvIHZlbmRvcgo+ID4gPiA+IGRyaXZlciwKPiA+ID4gPiAgICBhLiBp
ZiB2ZW5kb3IgZHJpdmVyIGZpbmRzIHRoZXJlJ3MgcHJldmlvdXNseSB1bnRyYW5zbWl0dGVkIGRh
dGEsIHJldHVybnMKPiA+ID4gPiAgICB0aGVtIHVudGlsIGFsbCB0cmFuc21pdHRlZC4KPiA+ID4g
PiAgICBiLiB2ZW5kb3IgZHJpdmVyIHRoZW4gcXVlcmllcyBkaXJ0eSBkYXRhIGFnYWluIGFuZCB0
cmFuc21pdHMgdGhlbS4KPiA+ID4gPiAgICBjLiBhdCBsYXN0LCB2ZW5kb3IgZHJpdmVyIHF1ZXJp
cyBkZXZpY2UgY29uZmlnIGRhdGEgKHdoaWNoIGhhcyB0byBiZQo+ID4gPiA+ICAgIHF1ZXJpZWQg
YXQgbGFzdCBhbmQgc2VudCBvbmNlKSBhbmQgdHJhbnNtaXRzIHRoZW0uICAKPiA+IAo+ID4gVGhp
cyBzZWVtcyBicm9rZW4sIHRoZSB2ZW5kb3IgZHJpdmVyIGlzIHByZXN1bWluZyB0aGUgdXNlciBp
bnRlbnRpb25zLgo+ID4gSWYgbG9nZ2luZyBpcyB1bnNldCwgd2UgcmV0dXJuIHRvIGJ1bGxldCAx
LCByZWFkaW5nIGRhdGEgaXMgdW5kZWZpbmVkCj4gPiBhbmQgdmVuZG9yIHNwZWNpZmljLiAgSXQn
cyBvdXRzaWRlIG9mIHRoZSBzZXNzaW9uLgo+ID4gICAKPiA+ID4gPiBmb3IgdGhlIDEgYnVsbGV0
LCBpZiBMT0dHSU5HIHN0YXRlIGlzIGZpcnN0bHkgc2V0IGFuZCBtaWdyYXRpb24gYWJvcnRzCj4g
PiA+ID4gdGhlbiwgIHZlbmRvciBkcml2ZXIgaGFzIHRvIGJlIGFibGUgdG8gZGV0ZWN0IHRoYXQg
Y29uZGl0aW9uLiBzbyBzZWVtaW5nbHksCj4gPiA+ID4gdmVuZG9yIGRyaXZlciBoYXMgdG8ga25v
dyBtb3JlIHFlbXUncyBtaWdyYXRpb24gc3RhdGUsIGxpa2UgbWlncmF0aW9uCj4gPiA+ID4gY2Fs
bGVkIGFuZCBmYWlsZWQuIERvIHlvdSB0aGluayB0aGF0J3MgYWNjZXB0YWJsZT8gIAo+ID4gCj4g
PiBJZiBtaWdyYXRpb24gYWJvcnRzLCBsb2dnaW5nIGlzIGNsZWFyZWQgYW5kIHRoZSBkZXZpY2Ug
Y29udGludWVzCj4gPiBvcGVyYXRpb24uICBJZiBhIG5ldyBtaWdyYXRpb24gaXMgc3RhcnRlZCwg
dGhlIHNlc3Npb24gaXMgaW5pdGlhdGVkIGJ5Cj4gPiBlbmFibGluZyBsb2dnaW5nLiAgU291bmQg
cmVhc29uYWJsZT8gIFRoYW5rcywKPiA+ICAKPiAKPiBGb3IgdGhlIGZsb3csIEkgc3RpbGwgaGF2
ZSBhIHF1ZXN0aW9uLgo+IFRoZXJlIGFyZSAyIGFwcHJvYWNoZXMgYmVsb3csIHdoaWNoIG9uZSBk
byB5b3UgcHJlZmVyPwo+IAo+IEFwcHJvYWNoIEEsIGluIHByZWNvcHkgc3RhZ2UsIHRoZSBzZXF1
ZW5jZSBpcwo+IAo+ICgxKQo+IC5zYXZlX2xpdmVfcGVuZGluZyAtLT4gcmV0dXJuIHdob2xlIHNu
YXBzaG90IHNpemUKPiAuc2F2ZV9saXZlX2l0ZXJhdGUgLS0+IHNhdmUgd2hvbGUgc25hcHNob3QK
PiAKPiAoMikKPiAuc2F2ZV9saXZlX3BlbmRpbmcgLS0+IGdldCBkaXJ0eSBkYXRhLCByZXR1cm4g
ZGlydHkgZGF0YSBzaXplCj4gLnNhdmVfbGl2ZV9pdGVyYXRlIC0tPiBzYXZlIGFsbCBkaXJ0eSBk
YXRhCj4gCj4gKDMpCj4gLnNhdmVfbGl2ZV9wZW5kaW5nIC0tPiBnZXQgZGlydHkgZGF0YSBhZ2Fp
biwgcmV0dXJuIGRpcnR5IGRhdGEgc2l6ZQo+IC5zYXZlX2xpdmVfaXRlcmF0ZSAtLT4gc2F2ZSBh
bGwgZGlydHkgZGF0YQo+IAo+IAo+IEFwcHJvYWNoIEIsIGluIHByZWNvcHkgc3RhZ2UsIHRoZSBz
ZXF1ZW5jZSBpcwo+ICgxKQo+IC5zYXZlX2xpdmVfcGVuZGluZyAtLT4gcmV0dXJuIHdob2xlIHNu
YXBzaG90IHNpemUKPiAuc2F2ZV9saXZlX2l0ZXJhdGUgLS0+IHNhdmUgcGFydCBvZiBzbmFwc2hv
dAo+IAo+ICgyKQo+IC5zYXZlX2xpdmVfcGVuZGluZyAtLT4gcmV0dXJuIHJlc3QgcGFydCBvZiB3
aG9sZSBzbmFwc2hvdCBzaXplICsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjdXJy
ZW50IGRpcnR5IGRhdGEgc2l6ZQo+IC5zYXZlX2xpdmVfaXRlcmF0ZSAtLT4gc2F2ZSBwYXJ0IG9m
IHNuYXBzaG90IAo+IAo+ICgzKSByZXBlYXQgKDIpIHVudGlsIHdob2xlIHNuYXBzaG90IHNhdmVk
Lgo+IAo+ICg0KSAKPiAuc2F2ZV9saXZlX3BlbmRpbmcgLS0+IGdldCBkaXJ5dCBkYXRhIGFuZCBy
ZXR1cm4gY3VycmVudCBkaXJ0eSBkYXRhIHNpemUKPiAuc2F2ZV9saXZlX2l0ZXJhdGUgLS0+IHNh
dmUgcGFydCBvZiBkaXJ0eSBkYXRhCj4gCj4gKDUpCj4gLnNhdmVfbGl2ZV9wZW5kaW5nIC0tPiBy
ZXR1cm4gcmVzZXQgcGFydCBvZiBkaXJ0eSBkYXRhIHNpemUgKwo+IAkJCSAgICAgZGVsdGEgc2l6
ZSBvZiBkaXJ0eSBkYXRhCj4gLnNhdmVfbGl2ZV9pdGVyYXRlIC0tPiBzYXZlIHBhcnQgb2YgZGly
dHkgZGF0YQo+IAo+ICg2KQo+IHJlcGVhdCAoNSkgdW50aWwgcHJlY29weSBzdG9wcwoKSSBkb24n
dCByZWFsbHkgdW5kZXJzdGFuZCB0aGUgcXVlc3Rpb24gaGVyZS4gIElmIHRoZSB2ZW5kb3IgZHJp
dmVyJ3MKYXBwcm9hY2ggaXMgdG8gc2VuZCBhIGZ1bGwgc25hcHNob3QgZm9sbG93ZWQgYnkgaXRl
cmF0aW9ucyBvZiBkaXJ0eQpkYXRhLCB0aGVuIHdoZW4gdGhlIHVzZXIgZW5hYmxlcyBsb2dnaW5n
IGFuZCByZWFkcyB0aGUgY291bnRlciBmb3IKYXZhaWxhYmxlIGRhdGEgaXQgc2hvdWxkIHJlcG9y
dCB0aGUgKHNpemUgb2YgdGhlIHNuYXBzaG90KS4gIFRoZSBuZXh0CnRpbWUgdGhlIHVzZXIgcmVh
ZHMgdGhlIGNvdW50ZXIsIGl0IHNob3VsZCByZXBvcnQgdGhlIHNpemUgb2YgdGhlCihzaXplIG9m
IHRoZSBzbmFwc2hvdCkgLSAod2hhdCB0aGUgdXNlciBoYXMgYWxyZWFkeSByZWFkKSArIChzaXpl
IG9mCnRoZSBkaXJ0eSBkYXRhIHNpbmNlIHRoZSBzbmFwc2hvdCkuICBBcyB0aGUgdXNlciBjb250
aW51ZXMgdG8gcmVhZCBwYXN0CnRoZSBzbmFwc2hvdCBkYXRhLCB0aGUgYXZhaWxhYmxlIGRhdGEg
Y291bnRlciB0cmFuc2l0aW9ucyB0byByZXBvcnRpbmcKb25seSB0aGUgc2l6ZSBvZiB0aGUgcmVt
YWluaW5nIGRpcnR5IGRhdGEsIHdoaWNoIGlzIG1vbm90b25pY2FsbHkKaW5jcmVhc2luZy4gIEkg
Z3Vlc3MgdGhpcyB3b3VsZCBiZSBtb3JlIHNpbWlsYXIgdG8geW91ciBhcHByb2FjaCBCLAp3aGlj
aCBzZWVtcyB0byBzdWdnZXN0IHRoYXQgdGhlIGludGVyZmFjZSBuZWVkcyB0byBjb250aW51ZSBw
cm92aWRpbmcKZGF0YSByZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhlIHVzZXIgZnVsbHkgZXhoYXVz
dGVkIHRoZSBhdmFpbGFibGUgZGF0YQpmcm9tIHRoZSBwcmV2aW91cyBjeWNsZS4gIFRoYW5rcywK
CkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50
ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
dnQtZGV2

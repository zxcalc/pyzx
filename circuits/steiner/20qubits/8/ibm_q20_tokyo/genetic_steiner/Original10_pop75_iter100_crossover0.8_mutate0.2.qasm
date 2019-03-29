// Initial wiring: [17, 6, 15, 10, 19, 4, 5, 1, 13, 7, 14, 3, 18, 9, 2, 0, 11, 16, 12, 8]
// Resulting wiring: [17, 6, 15, 10, 19, 4, 5, 1, 13, 7, 14, 3, 18, 9, 2, 0, 11, 16, 12, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[2];
cx q[14], q[13];
cx q[18], q[17];
cx q[16], q[17];
cx q[13], q[15];
cx q[8], q[10];
cx q[5], q[14];
cx q[5], q[6];

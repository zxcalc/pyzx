// Initial wiring: [10, 12, 15, 3, 7, 16, 13, 6, 1, 17, 11, 0, 14, 2, 4, 18, 5, 19, 9, 8]
// Resulting wiring: [10, 12, 15, 3, 7, 16, 13, 6, 1, 17, 11, 0, 14, 2, 4, 18, 5, 19, 9, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[13], q[7];
cx q[18], q[17];
cx q[14], q[15];
cx q[13], q[15];
cx q[10], q[11];
cx q[3], q[6];
cx q[2], q[3];

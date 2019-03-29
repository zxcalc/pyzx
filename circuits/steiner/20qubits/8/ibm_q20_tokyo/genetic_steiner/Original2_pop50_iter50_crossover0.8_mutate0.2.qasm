// Initial wiring: [19, 9, 15, 11, 14, 10, 5, 3, 4, 17, 2, 6, 13, 7, 1, 8, 0, 18, 16, 12]
// Resulting wiring: [19, 9, 15, 11, 14, 10, 5, 3, 4, 17, 2, 6, 13, 7, 1, 8, 0, 18, 16, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[2];
cx q[8], q[1];
cx q[12], q[7];
cx q[14], q[5];
cx q[17], q[12];
cx q[13], q[15];
cx q[8], q[10];
cx q[6], q[7];

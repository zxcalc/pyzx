// Initial wiring: [0, 1, 10, 17, 8, 13, 3, 18, 4, 7, 14, 15, 9, 2, 19, 11, 16, 6, 5, 12]
// Resulting wiring: [0, 1, 10, 17, 8, 13, 3, 18, 4, 7, 14, 15, 9, 2, 19, 11, 16, 6, 5, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[6], q[5];
cx q[10], q[8];
cx q[18], q[19];
cx q[14], q[15];
cx q[10], q[11];
cx q[11], q[18];

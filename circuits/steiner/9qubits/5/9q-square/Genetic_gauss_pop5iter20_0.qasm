// Initial wiring: [0 1 2 3 4 5 6 8 7]
// Resulting wiring: [5 1 2 3 8 0 6 7 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[4], q[7];
cx q[4], q[7];
cx q[4], q[7];
cx q[4], q[1];
cx q[0], q[5];
cx q[0], q[5];
cx q[0], q[5];
cx q[7], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[6], q[5];
cx q[4], q[3];
cx q[6], q[7];

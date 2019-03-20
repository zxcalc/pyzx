// Initial wiring: [0 4 1 8 2 5 6 7 3]
// Resulting wiring: [0 4 1 8 2 5 6 7 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[5];
cx q[5], q[4];
cx q[0], q[1];
cx q[4], q[3];
cx q[6], q[7];

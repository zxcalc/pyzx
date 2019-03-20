// Initial wiring: [0 4 2 3 1 5 7 8 6]
// Resulting wiring: [5 4 2 3 1 0 7 8 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[4];
cx q[5], q[4];
cx q[6], q[5];
cx q[0], q[5];
cx q[0], q[5];
cx q[0], q[5];
cx q[6], q[7];
cx q[6], q[5];

// Initial wiring: [0 4 2 3 5 1 6 7 8]
// Resulting wiring: [0 4 2 3 5 1 6 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[6], q[5];
cx q[3], q[8];

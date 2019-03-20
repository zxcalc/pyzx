// Initial wiring: [0 2 3 8 4 5 6 7 1]
// Resulting wiring: [0 2 3 8 4 5 6 7 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[4];
cx q[0], q[1];
cx q[6], q[7];
